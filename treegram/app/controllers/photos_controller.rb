class PhotosController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    if params[:photo] == nil

      flash[:alert] = "Please upload a photo"
      redirect_to :back
    else
    @photo = Photo.create(photo_params)
      @photo.user_id = @user.id
      @photo.save
      flash[:notice] = "Successfully uploaded a photo"
      redirect_to user_path(@user)
    end
  end

  def new
    @user = User.find(params[:user_id])
    @photo = Photo.create()
  end

  def delete
    @user = User.find(params[:id])
    @photo = Photo.find(params[:image_id])
    if Integer(params[:id]) == Integer(@photo.user_id)
      @tags = Tag.where(photo_id:params[:image_id])
      @comment = Comment.where(image_id:params[:image_id])
      @comment.each do |c|
        c.destroy
      end
      @tags.each do |t|
        t.destroy
      end

      @photo.destroy

      flash[:notice] = "photo '#{@photo.title}' deleted."
    end
    redirect_to user_path(@user)
  end

  private
  def photo_params
    params.require(:photo).permit(:image, :title)
  end
end
