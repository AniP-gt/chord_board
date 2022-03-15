class RelationshipsController < ApplicationController

  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  # def create
  #   current_user.follow(params[:user_id])
  #   respond_to do |format|
  #     format.html { redirect_to request.referer }
  #     format.js
  #   end
  # end

  # def destroy
  #   current_user.unfollow(params[:user_id])
  #   respond_to do |format|
  #     format.html { redirect_to request.referer }
  #     format.js
  #   end
  # end


  # def create
  #   user = User.find(params[:followed_id])
  #   current_user.follow(user)
  #   respond_to do |format|
  #     format.html { redirect_to @user }
  #     format.js
  #   end
  # end

  # def destroy
  #   user = Relationship.find(params[:id]).followed
  #   current_user.unfollow(user)
  #   respond_to do |format|
  #     format.html { redirect_to @user }
  #     format.js
  #   end
  # end


end
