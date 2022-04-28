require 'rails_helper'

RSpec.describe "ChordsController", type: :request do

  let(:user) {FactoryBot.create(:user)}
  let(:chord) {FactoryBot.create(:chord)}

  describe "#chord/index" do
    before do
      sign_in user
    end
    it "正常なレスポンスか？" do
      get chords_path
      expect(response).to be_truthy
    end
    it "200レスポンスが返ってきているか？" do
      get chords_path
      expect(response).to have_http_status "200"
    end
  end

  describe "#chord/new" do
    before do
      sign_in user
    end
    it "正常なレスポンスか？" do
      get new_chord_path
      expect(response).to be_truthy
    end
    it "200レスポンスが返ってきているか？" do
      get new_chord_path
      expect(response).to have_http_status "200"
    end
  end

  describe "#chord/create" do
    before do
      sign_in user
    end
    it "投稿に成功した場合１件増える" do
      expect {post chords_path, params: {chord: { title: "テストコード", body: "テストテストテスト", work: "A7,A7,D7,D7,"}}}.to change(Chord, :count).by 1
    end
    it "投稿した後、chord/indexにリダイレクトすること" do
      post chords_path, params: {chord: { title: "テストコード", body: "テストテストテスト", work: "A7,A7,D7,D7,"}}
      expect(response).to redirect_to chords_path()
    end
  end

  describe "#chord/destroy" do
    before do
      sign_in user
      post chords_path , params: {chord: { title: "テストコード", body: "テストテストテスト", work: "A7,A7,D7,D7,"}}
    end
    it "投稿を削除した場合１件減る" do
      expect {delete chord_path chord.id, params: {chord: { title: "テストコード", body: "テストテストテスト", work: "A7,A7,D7,D7,"}}}.to change(Chord, :count).by 0
    end
    it "投稿した後、chord/indexにリダイレクトすること" do
      delete chord_path chord.id, params: {chord: { title: "テストコード", body: "テストテストテスト", work: "A7,A7,D7,D7,"}}
      expect(response).to redirect_to root_path
    end
  end

end