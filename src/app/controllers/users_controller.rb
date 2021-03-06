class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all.page(params[:page]).per(20)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to users_path, alert: '不正なアクセスです'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: '更新しました'
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id]).destroy
    redirect_to root_path, notice: '退会しました。またのご利用お待ちしております。'
  end


  def following
    user = User.find(params[:id])
    @users = user.following.page(params[:page]).per(20)
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers.page(params[:page]).per(20)
  end

  def favorites
    user = User.find(params[:id])
    favorite = Favorite.where(user_id: user.id).pluck(:chord_id)
    @favorite_chord = Chord.find(favorite)
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :profile, :profile_image)
  end

end
