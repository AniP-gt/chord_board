require 'rails_helper'

RSpec.describe "Favorites", type: :request do

  let(:user) {FactoryBot.create(:user)}
  let(:other_user) {FactoryBot.create(:user)}
  let(:favorite) {FactoryBot.create(:favorite)}

  describe "#Favorite/create" do
    before do
      sign_in user
    end
    it "Favoriteの数が1件増えること" do
      expect {post chord_favorites_path(favorite), params: {favorites: chord_id.id}}.to change(Favorite, :count).by 1
    end
  end
end
