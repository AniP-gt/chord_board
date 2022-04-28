require 'rails_helper'

RSpec.describe Relationship, type: :model do

  let(:relationship) {FactoryBot.create(:relationship)}

  describe "#relationships/create" do
    context "フォローできる場合" do
      it "全てのパラメーターがそろっていればフォローできる" do
        expect(relationship).to be_valid
      end

      it "follower_idがnilの場合保存できない" do
        relationship.follower_id = nil
        expect(relationship).not_to be_valid
      end

      it "followed_idがnilの場合保存できない" do
        relationship.followed_id = nil
        expect(relationship).not_to be_valid
      end
    end
  end
end
