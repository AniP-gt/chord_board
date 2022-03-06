require 'rails_helper'

RSpec.describe Relationship, type: :model do

  before do
    @relationship = build(:relationship)
    @user = build(:user)
  end

  describe "リレーションシップ" do

    it "ユーザーの存在性の確認" do
      expect(@relationship).to be_valid
      expect(@user).to  be_valid
    end

    

  end


end
