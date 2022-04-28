require 'rails_helper'

RSpec.describe 'ログインの統合テスト' , type: :system do
  context "無効なデータを入力した場合" do
    scenario "ログイン画面にリダイレクトする" do
      visit root_path
      page.all(".menu-list")[2].click #メニューバー ログイン
      fill_in "Eメール",	with: "user@invalid"
      fill_in "パスワード",	with: "123"
      click_button "ログイン"
      expect(page).to have_content('Eメールまたはパスワードが違います。')
    end
  end

  context "有効なデータを入力した場合" do
    before do
      @user = FactoryBot.create(:user,:test_user)
    end
    scenario "ログインをし、その後ログアウトを行う" do
      visit root_path
      page.all(".menu-list")[2].click #メニューバー ログイン
      fill_in "Eメール",	with: "test20@example.com"
      fill_in "パスワード",	with: "123456"
      click_button "ログイン"
      expect(page).to have_content('ログインしました')
      page.all(".menu-list")[4].click #メニューバー ログアウト
      expect(page).to have_content('ログアウトしました')
    end
  end
end