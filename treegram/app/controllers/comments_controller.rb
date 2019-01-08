class CommentsController < ApplicationController

  def createComment

    @comment = Comment.create("image_id" => params[:image_id], "user_id" => params[:id], "comment" => params[:comment][:comment])

    redirect_to user_path(User.find(params[:id]))
    flash[:notice]= "You have successfully added a Comment."

  end


  def find
    puts params[:image_id]
    @imagePosts = Comment.where(image_id:params[:image_id])
    @users = User.all
    @user = User.find(params[:id])
    @photo = Photo.find(params[:image_id])
    @tag = Tag.new
    render(:partial => 'show', :locals => { :imagePosts => @imagePosts, :users => @users, :photo => @photo, :tag => @tag }) if request.xhr?
  end






end
