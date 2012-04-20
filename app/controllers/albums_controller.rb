class AlbumsController < ApplicationController
  before_filter :require_user
  layout :set_layout
  

  # GET /albums
  def index
    #@albums = Album.all
    @albums = Album.all.paginate(:page=>params[:page],:per_page=>9)
      respond_to do |format|
      format.html # index.html.erb
      format.json { render json=> @albums }
      end
  end

  # GET /albums/1
  def show
    @album = Album.find(params[:id])
      respond_to do |format|
      format.html # show.html.erb
      format.json { render json=> @album }
    end
  end

  # GET /albums/new
  def new
    @album = Album.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json=> @album }
    end
  end

  # GET /albums/1/edit
  def edit
    @album = current_user.albums.find(params[:id])
  end

  # POST /albums
  def create
    @album = current_user.albums.build(params[:album])    
    respond_to do |format|
      if @album.save
        flash[:notice]="Album successfully created !"
        format.html { redirect_to @album}
      else
        format.html { render :action=> "new" }
      end
    end
  end

  # PUT /albums/1
  def update
    @album = current_user.albums.find(params[:id])
    if @album 
	respond_to do |format|
	  if @album.update_attributes(params[:album])
	    format.html { redirect_to @album, notice=> 'Album was successfully updated.' }
	  else
	    format.html { render action=> "edit" }
	  end
	end
    else

    end
  end

  # DELETE /albums/1
  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    respond_to do |format|
      format.html { redirect_to my_albums_albums_url }
    end
  end

  def my_albums
    @albums = Album.find(:all,:conditions=>[" user_id = ? " , current_user.id] )
    @albums = Album.find(:all,:conditions=>[" user_id = ? " , current_user.id]).paginate(:page=>params[:page],:per_page=>3)    
    render :template => 'albums/index'
  end

  def all_albums
    #@albums = Album.find(:all,:conditions=>[" user_id = ? " , current_user.id] )
    #@albums = current_user.albums
    @albums = Album.all.paginate(:page=>params[:page],:per_page=>9)
    render :template => 'albums/all_albums'
  end
end
