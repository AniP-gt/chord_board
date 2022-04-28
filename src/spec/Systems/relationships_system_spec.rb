require 'rails_helper'
# require 'support/relationships_support'

RSpec.describe 'フォロー/フォロー解除の統合テスト' , type: :system, js: true do

  before do
    @user = FactoryBot.create(:user)
    @other_user = FactoryBot.create(:user)
  end

  describe "作品一覧からフォロー/フォロー解除する場合" do
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

    scenario "フォローした後、フォローを解除する"do
      sign_in @user
      visit chords_path
      find_by_id("follow_do").click
      expect(page).to have_content "フォロー中"
      find_by_id("follow_now").click
      expect(page).to have_content "フォローする"
    end

  end

  describe "作曲者一覧からフォローする場合" do
    scenario "フォローした後、フォローを解除する" do
      sign_in @user
      visit users_path
      find_by_id("follow_do").click
      expect(page).to have_content "フォロー中"
      find_by_id("follow_now").click
      expect(page).to have_content "フォローする"
    end
  end

end