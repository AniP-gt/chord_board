require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー登録" do
    context "新規登録ができる場合" do
      it 'username、email、passwordとpassword_confirmationが存在すれば登録できること' do
        expect(@user).to be_valid
      end
    end

    context "新規登録に失敗する場合" do
      it 'username、email、passwordとpassword_confirmationがいずれかないと登録できない' do
        @user.username = ""
        expect(@user).not_to be_valid
      end
    end
  end

  describe "パスワードの登録" do
    context 'passwordのみのテスト' do
      it 'passwordが6文字未満だと登録できない' do
        @user.password = '12345'
        expect(@user).not_to be_valid
      end
    end
    context "passwordとpassword_confirmationの統合テスト" do
      it 'passwordとpassword_confirmationが一致しないと登録できない'do
        @user.password_confirmation = '123457'
        expect(@user).not_to be_valid
      end
    end
  end

end
