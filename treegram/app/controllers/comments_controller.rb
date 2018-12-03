class CommentsController < ApplicationController

  def createComment

    @comment = Comment.create("image_id" => params[:image_id], "user_id" => params[:id], "comment" => params[:comment][:comment])

    redirect_to user_path(User.find(params[:id]))
    flash[:notice]= "You have successfully added a Comment."

  end





end
