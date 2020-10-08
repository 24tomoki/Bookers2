class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :screen_only_user, only: [:edit, :update]
  def index
   @users = User.all
    @user = current_user
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @newbook = Book.new
  end

  # def create
  #   user = User.new(user_params)
  #   user.save
  #   redirect_to user_path(user)
  # end

  def edit
   @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'successfully'
    else
      render 'edit'
    end
  end

  def follows
    @user = User.find(params[:id])
    @users = @user.followings
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  def screen_only_user
    if current_user.id != params[:id].to_i
      redirect_to user_path(current_user)
    end
  end
end
