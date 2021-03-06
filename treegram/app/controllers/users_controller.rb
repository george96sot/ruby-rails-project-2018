class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    @user.valid?
    if !@user.is_email?
      flash[:alert] = "Input a properly formatted email."
      redirect_to :back
    elsif @user.errors.messages[:email] != nil
      flash[:notice]= "That email " + @user.errors.messages[:email].first
      redirect_to :back
    elsif @user.save
      flash[:notice]= "Signup successful. Welcome to the site!"
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:alert] = "There was a problem creating your account. Please try again."
      redirect_to :back
    end
  end

  def new
  end

  def show
    @users = User.all
    @user = User.find(params[:id])

    @following = Follow.where(follower_id:params[:id]).pluck(:following_id)
    @usersFollowing = User.where(id: @following ).select { |u| u.photos.length > 0 }

    @comments = Comment.all
    @tag = Tag.new
  end

  def all_users
    @users = User.all
    @user = User.find(params[:id])
    begin
      @followers = Follow.where(following_id:params[:id])
    rescue ActiveRecord::RecordNotFound => e1
      @followers = []
    end
    begin
      @following = Follow.where(follower_id:params[:id])
    rescue ActiveRecord::RecordNotFound => e2
      @following = []
    end
  end

  def posts
    @users = User.all
    @user = User.find(params[:id])
    @photos= Photo.all
    @comments = Comment.all
    @tag = Tag.new
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :avatar)
  end


end
