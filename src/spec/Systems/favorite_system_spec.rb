require 'rails_helper'
# require 'support/relationships_support'

RSpec.describe 'いいね/いいね解除の統合テスト' , type: :system, js: true do

  before do
    @user = FactoryBot.create(:user)
    @other_user = FactoryBot.create(:user)
  end

  describe "いいね/いいね解除する場合" do
    # テストユーザーが１つ投稿をし、ログアウトする
    before do
      sign_in @other_user
      visit new_chord_path
      find_by_id("A7").click
      fill_in "chord_title",	with: "ブルース進行"
      fill_in "chord_body",	with: "キーAの王道ブルースです"
      click_button "投稿"
      page.all(".menu-list")[4].click #メニューバー ログアウト
    end
    context "chord/index" do
      scenario "いいねした後、いいねを解除する"do
        sign_in @user
        visit chords_path
        find_by_id("favorite_post").click
        expect(page).to have_content "♥1いいね"
        find_by_id("favorite_delete").click
        expect(page).to have_content "♡0いいね"
      end
    end
    context "user/show" do
      scenario "いいねした後、いいねを解除する"do
        sign_in @user
        visit user_path(@other_user)
        find_by_id("favorite_post").click
        expect(page).to have_content "♥1いいね"
        find_by_id("favorite_delete").click
        expect(page).to have_content "♡0いいね"
      end
    end
  end
end