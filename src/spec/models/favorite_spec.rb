require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let(:favorite) {FactoryBot.create(:favorite)}

  describe "#favotire/create" do
    context "いいねできる場合" do
      it "favoriteの存在性の確認" do
        expect(favorite).to be_valid
      end

      it "user_idがnilの場合保存できない" do
        favorite.user_id = nil
        expect(favorite).not_to be_valid
      end

      it "chord_idがnilの場合保存できない" do
        favorite.chord_id = nil
        expect(favorite).not_to be_valid
      end
    end
  end
end
