require 'rails_helper'

RSpec.describe 'chordの統合テスト' , type: :system, js: true do

  describe "index画面" do
    context "ログイン前の状態" do
      scenario "chord/index画面に遷移できること" do
        visit root_path
        page.all(".menu-list")[0].click #メニューバー 作品一覧
        expect(page).to  have_content('作品一覧')
      end
    end
    context "ログイン後の状態" do
      let!(:user) {FactoryBot.create(:user)}
      before do
        sign_in user
      end
      scenario "index画面に遷移できること" do
        visit root_path
        page.all(".menu-list")[1].click #メニューバー 作品一覧
        expect(page).to  have_content('作品一覧')
      end
    end
  end


  describe "createアクションで投稿する" do
    let!(:user) {FactoryBot.create(:user)}
    before do
      sign_in user
    end
    context "投稿に失敗する場合" do
      scenario "new画面にリダイレクトすること" do
        visit new_chord_path
        expect(page).to have_content('作品投稿')
        fill_in "chord_title",	with: ""
        fill_in "chord_body",	with: ""
        click_button "投稿"
        expect(page).to have_content('3 エラー　空欄があります')
      end
    end
    context "投稿に成功する場合" do
      scenario "index画面に遷移し、投稿を削除すること" do
        visit new_chord_path
        expect(page).to have_content('作品投稿')
        find_by_id("A7").click
        fill_in "chord_title",	with: "ブルース進行"
        fill_in "chord_body",	with: "キーAの王道ブルースです"
        click_button "投稿"
        expect(page).to have_content('投稿に成功しました')
        page.accept_confirm do
          click_on :delete_btn
        end
        expect(page).to have_content('削除しました')
      end
    end
  end

end