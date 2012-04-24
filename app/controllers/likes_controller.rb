class LikesController < ApplicationController

def album_like
Like.create(:user_id=>current_user.id,:likedto_id=>params["id"],:likedto_type=>"Album")
redirect_to albums_path
end

def photo_like
redirect_to albums_path
end

def comment_like
redirect_to albums_path
end

def album_unlike
album_id=params["id"]
array = Like.all(:conditions=>"user_id = #{current_user.id} and likedto_id=#{album_id}").map(&:id)
array.each do |element|
	
@like=Like.find(element)
@like.destroy
end
   
redirect_to albums_path
end

def photo_unlike
redirect_to albums_path
end

def comment_unlike
redirect_to albums_path
end



end
