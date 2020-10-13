class AlbumsController < ApplicationController

    def new
        @album = Album.new
        render :new
    end

    def index
        render :index
    end

    def create
        album = Album.new(album_params)
        if album.save
            redirect_to album_url(album)
        else
            flash.now[:errors] = album.errors.full_messages
            @album = Album.new
            render :new
        end
    end

    def show
        @album = Album.find_by(id: params[:id])
        render :show
    end

    
    def edit
        @album = Album.find_by(id: params[:id])
        render :edit
    end
    
    def update
        @album = Album.find_by(id: params[:id])
        if @album.update(album_params)
            redirect_to album_url(@album)
        else
            flash[:errors] = @album.errors.full_messages
            redirect_to edit_album_url(@album)
        end
    end

    def destroy
        @album = album.find_by(id: params[:id])
        @album.destroy
        redirect_to albums_url
    end
    
    def album_params
        params.require(:album).permit(:band_id, :title, :year, :live)
    end
end