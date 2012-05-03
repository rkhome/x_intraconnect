class LikesController < ApplicationController
before_filter :require_user
  def album_like
    Like.create(:user_id=>current_user.id,:likedto_id => params[:id],:likedto_type => 'Album')
    @album=Album.find(params[:id])
    @album.update_attributes(:likes_count=>@album.likes_count+1)
    redirect_to my_albums_albums_path

  end

  def album_unlike
    @album=Album.find(params[:id])
    like=@album.likes.where("user_id=#{current_user.id} and likedto_type='Album'")[0]
    like.destroy
    @album.update_attributes(:likes_count=>@album.likes_count-1)
    redirect_to my_albums_albums_path
  end


  def all_album_like
    Like.create(:user_id=>current_user.id,:likedto_id => params[:id],:likedto_type => 'Album')
    @album=Album.find(params[:id])
    @album.update_attributes(:likes_count=>@album.likes_count+1)
    redirect_to  all_albums_albums_path
  end

  def all_album_unlike
    @album=Album.find(params[:id])
    like=@album.likes.where("user_id=#{current_user.id} and likedto_type='Album'")[0]
    like.destroy
    @album.update_attributes(:likes_count=>@album.likes_count-1)
    redirect_to  all_albums_albums_path
  end


  def photo_like
    Like.create(:user_id=>current_user.id,:likedto_id => params[:id],:likedto_type => 'Photo')
    @photo=Photo.find(params[:id])
    @photo.update_attributes(:likes_count=>@photo.likes_count+1)
    redirect_to album_photos_path(@photo.album)
  end

  def photo_unlike
    @photo=Photo.find(params[:id])
    like=@photo.likes.where("user_id=#{current_user.id} and likedto_type='Photo'")[0]
    like.destroy
    @photo.update_attributes(:likes_count=>@photo.likes_count-1)
    redirect_to album_photos_path(@photo.album)
  end

  def comment_like
   
    Like.create(:user_id=>current_user.id,:likedto_id => params[:id],:likedto_type => 'Comment')
    @comment=Comment.find(params[:id])
    photo=@comment.photo
    @comment.update_attributes(:likes_count=>@comment.likes_count+1)
    redirect_to album_photo_path(photo.album,photo)  
  end

  def comment_unlike
    @comment=Comment.find(params[:id])
    like=@comment.likes.where("user_id=#{current_user.id} and likedto_type='Comment'")[0]
    photo=@comment.photo
    like.destroy
    @comment.update_attributes(:likes_count=>@comment.likes_count-1)
    redirect_to album_photo_path(photo.album,photo)  
  end

   def solution_like
    Like.create(:user_id=>current_user.id,:likedto_id => params[:id],:likedto_type => 'Solution')
    @solution=Solution.find(params[:id])
    @solution.update_attributes(:likes_count=>@solution.likes_count+1)
    redirect_to search_solutions_solutions_path

  end

  def solution_unlike
    @solution=Solution.find(params[:id])
    like=@solution.likes.where("user_id=#{current_user.id} and likedto_type='Solution'")[0]
    like.destroy
    @solution.update_attributes(:likes_count=>@solution.likes_count-1)
    redirect_to search_solutions_solutions_path
  end



end
