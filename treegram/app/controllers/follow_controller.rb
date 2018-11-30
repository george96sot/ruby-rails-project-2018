class FollowController < ApplicationController

  def follow_params
   params.permit(:follower_id => params[:id], :following_id => params[:following_id])
  end

  def createFollow
    @x = follow_params
    print @x
    print "hi "
    @follow = Follow.create("follower_id" => params[:id], "following_id" => params[:following_id])
#  @following_user = User.find(params[:following_id])

  # return to link all_users
    redirect_to all_users_path(session[:user_id])
  end
end
