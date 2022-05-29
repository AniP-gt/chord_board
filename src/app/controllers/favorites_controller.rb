class FavoritesController < ApplicationController

  def create
    chord = Chord.find(params[:chord_id])
    favorite = current_user.favorites.new(chord_id: chord.id)
    favorite.save
    redirect_to request.referer || root_url
  end

  def destroy
    chord = Chord.find(params[:chord_id])
    favorite = current_user.favorites.find_by(chord_id: chord.id)
    favorite.destroy
    redirect_to request.referer || root_url
  end

end
