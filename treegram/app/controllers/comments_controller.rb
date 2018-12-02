class CommentsController < ApplicationController

  def createComment

    @comment = Comment.create("image_id" => params[:image_id], "user_id" => params[:id], "comment" => params[:comment][:comment])
    if @comment.save
      redirect_to user_path(User.find(params[:id]))
      flash[:notice]= "You have successfully added a Comment."
    else
      flash[:alert] = "There was a problem adding a comment.. Please try again."
    end
  end





end
