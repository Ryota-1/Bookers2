class RelationshipsController < ApplicationController

  def follow
    current_user.follow(params[:id])
    redirect_back(fallback_location: root_path)
  end

  def unfollow
    current_user.unfollow(params[:id])
    redirect_back(fallback_location: root_path)
  end

  def follows
  	@user = User.find(params[:id])
    @users = @user.following_user
  	@newbook = Book.new
  end

  def followers
  	@user = User.find(params[:id])
    @users = @user.follower_user
  	@newbook = Book.new
  end
end
