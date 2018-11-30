class FollowController < ApplicationController

  def follow_params
   params.require(:follow).permit(:follower_id => params[:id], :following_id => params[:following_id])
  end

  def createFollow
  # @follow = Follow.create(follow_params)
  # @following_user = User.find(params[:following_id])

  # return to link all_users
    redirect_to all_users_path(session[:user_id])
  end
end
