class SetlistsController < ApplicationController
    def new
        @setlist = Setlist.new 
    end
    def create
        @setlist = Setlist.new(setlist_params)
        @setlist.user_ids = current_user.id
        if @setlist.save
            
            redirect_to user_path(current_user) 
        else
            render :new
        end
    end
    def show
        @setlist = Setlist.find(params[:id]) 
    end
    private
    def setlist_params
        params.require(:setlist).permit(:name, :songs_attributes => [:song_ids => []])
    end 
end
