class FollowController < ApplicationController


  def createFollow
    @follow = Follow.create("follower_id" => params[:id], "following_id" => params[:following_id])
    if @follow.save
      redirect_to user_path(User.find(params[:id]))
      flash[:notice]= "You have successfully added a follower."
    else
      flash[:alert] = "There was a problem adding a follower.. Please try again."
    end
  end
end
