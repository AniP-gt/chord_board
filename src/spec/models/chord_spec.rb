require 'rails_helper'

RSpec.describe Chord, type: :model do

  let(:chord) {FactoryBot.create(:chord)}
  # let!(:day_before_yesterday) {FactoryBot.create(:chord, :day_before_yesterday)}
  # let!(:yesterday) {FactoryBot.create(:chord, :yesterday)}
  # let!(:now) {FactoryBot.create(:chord, :now)}


  it "Chordのバリエーション" do
    expect(chord).to be_valid
  end

  it "user_idがnilではないか" do
    chord.user_id = nil
    expect(chord).not_to be_valid
  end

  it "投稿コードが空である場合は無効" do
    chord.work = " "
    expect(chord).not_to be_valid
  end

  it "タイトルが30文字以内であるか" do
    chord.title = "a" * 31
    expect(chord).not_to be_valid
  end

  it "コメントが140文字以内であるか" do
    chord.title = "a" * 141
    expect(chord).not_to be_valid
  end

  it "投稿したユーザーが削除された場合、そのユーザーのChordも削除されること" do
    user = chord.user
    expect{user.destroy}.to change(Chord, :count).by -1
  end

end