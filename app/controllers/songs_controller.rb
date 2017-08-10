class SongsController < ApplicationController
    def index
        @songs = Song.all
    end
    def create
        @song = Song.build(song_params)
        @song.user_ids = current_user.id
        if @song.save
            redirect_to(request.referrer || root_path)
        else
            render :new
        end
    end
    def new
        @song = Song.new
    end
    def edit
        @song = Song.find(params[:id])
    end
    def show
        @song = Song.find(params[:id])
        @song_html = Chordpro.html(@song.content)
    end
    def update
        @song = Song.find(params[:id])
        if @song.update(song_params)
           redirect_to song_path(@song) 
        else
            render :edit
        end
    end
    def destroy
        @song = Song.find(params[:id])
        @song.destroy
    end
    
    private 
    def song_params
        params.require(:song).permit(:title, :artist, :content)
    end
end
