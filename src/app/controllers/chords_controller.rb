class ChordsController < ApplicationController
  def index
    @chords = Chord.all
    # respond_to do |format|
    #   format.html
    #   format.json{render json: @chords}
    # end
  end

  def show
  end

  def new
    @chord = Chord.new
  end

  # 投稿アクション
  def create
    @chord = Chord.new(chord_params)
    @chord.user_id = current_user.id
    @chord.save
    redirect_to chords_path()
  end

  def destroy
    chord = Chord.find(params[:id])
    chord.destroy
    redirect_to user_path(chord.user)
  end

  def edit
  end

  private

  def chord_params
    params.require(:chord).permit(:title,:body, :work)
  end

end
