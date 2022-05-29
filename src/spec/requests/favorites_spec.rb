require 'rails_helper'

RSpec.describe "Favorites", type: :request do

  let(:user) {FactoryBot.create(:user)}
  let(:other_user) {FactoryBot.create(:user)}
  let(:chord) {FactoryBot.create(:chord)}

  describe "#Favorite/create" do
    before do
      sign_in user
    end
    it "Favoriteの数が1件増えること" do
      expect {post chord_favorites_path(chord.id), params: {user_id: user.id, chord_id: chord.id}}.to change(Favorite, :count).by 1
    end
    it "いいねした後、リファラーページにリダイレクトすること" do
      post chord_favorites_path(chord.id)
      expect(response).to redirect_to root_url
    end
  end

  describe "#Favorite/destroy" do
    before do
      sign_in user
    end
    it "Favoriteの数が1件増えること" do
      post chord_favorites_path(chord.id)
      expect {delete chord_favorites_path(chord.id), params: {user_id: user.id, chord_id: chord.id}}.to change(Favorite, :count).by -1
    end
    it "いいねした後、いいね解除しリファラーページにリダイレクトすること" do
      post chord_favorites_path(chord.id)
      delete chord_favorites_path(chord.id)
      expect(response).to redirect_to root_url
    end
  end
end
