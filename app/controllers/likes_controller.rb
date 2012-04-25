class LikesController < ApplicationController

def album_like
Like.create(:user_id=>current_user.id,:likedto_id => params[:id],:likedto_type => 'Album')
@album=Album.find(params[:id])
@album.update_attributes(:likes_count=>@album.likes_count+1)
redirect_to my_albums_albums_path

end

def album_unlike
@album=Album.find(params[:id])
like=@album.likes(:conditions=>"user_id=#{current_user.id} and likedto_type=Album")[0]
like.destroy
@album.update_attributes(:likes_count=>@album.likes_count-1)


redirect_to my_albums_albums_path
end


def photo_like
end

def photo_unlike
end


end
