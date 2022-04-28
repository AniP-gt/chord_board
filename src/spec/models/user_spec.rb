require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) {FactoryBot.create(:user)}
  let(:other_user) {FactoryBot.create(:user)}

  describe "ユーザー登録" do
    context "新規登録ができる場合" do
      it "user情報が存在すれば登録できること" do
        expect(user).to be_valid
      end

      it "usernameの文字数が50字までか" do
        user.username = "a" * 51
        expect(user).not_to be_valid
      end

      it "emailの文字数が255字までか" do
        user.email = "a" * 244 + "@example.com"
        expect(user).not_to be_valid
      end

      it "メールアドレスの大文字、小文字を区別しない一意性のテスト" do
        duplicate_user = user.dup
        duplicate_user.email =user.email.upcase
        user.save
        expect(user).to be_valid
      end

    end

    context "新規登録に失敗する場合" do
      it 'usernameがないと登録できない' do
        user.username = ""
        expect(user).not_to be_valid
      end

      it 'emailがないと登録できない' do
        user.email = ""
        expect(user).not_to be_valid
      end

      it "有効なメールフォーマットのテスト" do
        valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
        valid_addresses.each do |valid_address|
          user.email = valid_address
          expect(user).to be_valid
        end
      end

      it "重複するメールアドレスを拒否するテスト" do
        duplicate_user = user.dup
        user.save
        expect(duplicate_user).not_to be_valid
      end

      it 'passwordが6文字未満だと登録できない' do
        user.password = '12345'
        expect(user).not_to be_valid
      end

      it 'passwordとpassword_confirmationが一致しないと登録できない'do
        user.password
        user.password_confirmation = '123457'
        expect(user).not_to be_valid
      end

    end
  end

  describe "コードの投稿とユーザーの削除（dependent: :destroyテスト）" do
    it "ユーザーを作成し、コードを投稿する。その後ユーザーを削除し、投稿数が１つ減るかどうかを確認する" do
      user.save
      user.chords.create!(title:"ブルース進行",body:"ブルース進行です", work: "A7,A7,D7,D7,")
      expect do
        user.destroy
      end.to change(Chord, :count).by(-1)
    end
  end

  describe "フォロー/フォロー解除機能" do
    context "フォローする場合" do
      it "ユーザーが他のユーザーをフォローすることができる" do
        user.follow(other_user.id)
        expect(user.following?(other_user)).to be_truthy
      end
    end

    context "フォローを解除する場合" do
      it "ユーザーが他のユーザーをフォロー解除することができる" do

        user.follow(other_user.id)
        user.relationships.find_by(followed_id: other_user).destroy
        expect(user.following?(other_user)).to be_falsy
      end
    end
  end



end
