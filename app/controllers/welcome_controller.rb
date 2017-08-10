class WelcomeController < ApplicationController
    def home
        if session[:user_id]
            @user = User.find(session[:user_id])
        else
            redirect_to signin_path
        end
    end
end