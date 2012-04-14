class AlbumsController < ApplicationController
  before_filter :require_user
  layout :set_layout

  def index
    @albums = Album.all
      respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @albums }
      end
  end

  def show
    @album = Album.find(params[:id])
      respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @album }
    end
  end

  def new
    @album = Album.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @album }
    end
  end

  def edit
    @album = current_user.albums.find(params[:id])
  end

  def create
    @album = current_user.albums.build(params[:album])
    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @album = current_user.albums.find(params[:id])
    if @album 
	respond_to do |format|
	  if @album.update_attributes(params[:album])
	    format.html { redirect_to @album, notice: 'Album was successfully updated.' }
	  else
	    format.html { render action: "edit" }
	  end
	end
    else
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    respond_to do |format|
      format.html { redirect_to my_albums_albums_url }
    end
  end

  def my_albums
    @albums = Album.find(:all,:conditions=>[" user_id = ? " , current_user.id] )
    render :template => 'albums/index'
  end
  def all_albums
    @albums = Album.all
    render :template => 'albums/all_albums'
  end
end
