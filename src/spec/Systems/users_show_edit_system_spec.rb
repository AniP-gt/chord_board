require 'rails_helper'

RSpec.describe 'show/editの統合テスト', type: :system do
  describe "編集に失敗する" do
    let!(:user) {FactoryBot.create(:user)}
    before do
      sign_in user
    end
    scenario "無効なデータを入力後、edit画面にリダイレクトすること" do
      visit user_path(user)
      expect(page).to  have_content('マイページ')
      find_by_id("edit_btn").click
      expect(page).to  have_content('マイページ編集')
      fill_in "ユーザー名",	with: ""
      fill_in "メールアドレス",	with: "test-exapmle"
      find_by_id("edit_submit").click
      expect(page).to  have_content('2 エラー空欄があります')
    end
  end
  describe "編集に成功する" do
    let!(:user) {FactoryBot.create(:user)}
    before do
      sign_in user
    end
    scenario "有効なデータを入力後、マイページ画面にリダイレクトすること" do
      visit user_path(user)
      expect(page).to  have_content('マイページ')
      find_by_id("edit_btn").click
      expect(page).to  have_content('マイページ編集')
      fill_in "ユーザー名",	with: "次元"
      fill_in "メールアドレス",	with: "test2@exapmle.com"
      fill_in "プロフィール", with: "プロフィールです"
      attach_file "user_profile_image", "app/assets/images/test.jpg"
      find_by_id("edit_submit").click
      expect(page).to  have_content('更新しました')
    end
  end
end