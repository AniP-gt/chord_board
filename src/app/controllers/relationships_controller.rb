class RelationshipsController < ApplicationController

  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer || root_url
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer || root_url
  end


end
