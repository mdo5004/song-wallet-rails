class SessionController < ApplicationController
    def new
        if logged_in?
            redirect_to root_path
        end
    end
    def create
        if auth_hash
            @user = User.find_or_create_by(:uid => auth_hash['uid']) do |u|
                u.name = auth_hash['info']['name']
                u.email = auth_hash['info']['email']
                u.location = auth_hash['info']['location']
                u.password = SecureRandom.hex(9)
            end
            user_authenticated = true
        else
            @user = User.find_by(email: session_params[:email])
            user_authenticated = @user.authenticate(session_params[:password])
        end

        if @user && user_authenticated
            flash[:success] = "Successfully logged in!"
            session[:user_id] = @user.id
            redirect_to root_path 
        else
            flash[:danger] = "Could not log in"
            render :new 
        end

    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end
    def guest
        @user = User.find_by(email: "guest@user.com")
        user_authenticated = @user.authenticate("password")
        if @user && user_authenticated
            flash[:success] = "Successfully logged in!"
            session[:user_id] = @user.id
            redirect_to root_path 
        else
            flash[:danger] = "Could not log in"
            render :new 
        end
    end
    private
    def session_params
        params.permit(:email, :password)
    end

    protected

    def auth_hash
        request.env['omniauth.auth']
    end
end