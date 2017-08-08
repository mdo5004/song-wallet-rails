class GroupsController < ApplicationController
    def new
        if current_user
            @group = current_user.groups.build 
        else
            @group = Group.new
        end
    end

    def create
        if current_user
            @group = current_user.groups.create(group_params)
            
        else
            redirect_to signin_path
        end
        redirect_to user_path(current_user)
    end

    def show
        @group = Group.find(params[:id])
    end
    
    private
    def group_params
        params.require(:group).permit(:name, :users_attributes => [:user_ids => []]) 
    end
end
