class ChordsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @chords = Chord.all.order(created_at: :desc).page(params[:page]).per(10)
  end

  def new
    @chord = Chord.new
  end

  # 投稿アクション
  def create
    @chord = Chord.new(chord_params)
    @chord.user_id = current_user.id
    if @chord.save
      redirect_to chords_path(), notice: '投稿に成功しました'
    else
      render :new
    end
  end

  def destroy
    chord = Chord.find(params[:id])
    chord.destroy
    redirect_to request.referer || root_url, notice: '削除しました'
  end


  private

  def chord_params
    params.require(:chord).permit(:title,:body, :work)
  end

end
