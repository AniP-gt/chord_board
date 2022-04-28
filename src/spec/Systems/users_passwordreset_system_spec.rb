require 'rails_helper'

RSpec.describe 'パスワードリセットの統合テスト' , type: :system do

  before do
    @user = FactoryBot.create(:user,:test_user)
    ActionMailer::Base.deliveries.clear
  end


  def extract_confirmation_url(mail)
    body = mail.body.encoded
    body[/http[^"]+/]
  end

  context "無効なデータを入力した場合" do
    scenario "エラーが発生し、パスワード再設定画面にリダイレクトする" do
      visit new_user_password_path
      expect(page).to have_http_status :ok
      fill_in "user[email]",	with: ""
      click_on("パスワードの再設定方法を送信する")
      expect(page).to  have_content('1 件のエラーが発生したため ユーザー は保存されませんでした。')
    end
    scenario "有効なデータを入力後、パスワード変更では無効なデータを入力し、エラーが発生すること" do
      visit new_user_password_path
      expect(page).to have_http_status :ok
      fill_in "user[email]",	with: "test20@example.com"
      expect { click_on 'パスワードの再設定方法を送信する' }.to change { ActionMailer::Base.deliveries.size }.by(1)
      expect(page).to  have_content('パスワードの再設定について数分以内にメールでご連絡いたします。')
      mail = ActionMailer::Base.deliveries.last
      url = extract_confirmation_url(mail)
      visit url
      expect(page).to have_content('パスワードを変更')
      fill_in "user[password]", with: ""
      fill_in "user[password_confirmation]", with: ""
      click_on("パスワードを変更する")
      expect(page).to have_content('1 件のエラーが発生したため ユーザー は保存されませんでした。')
    end
  end

  context "有効なデータを入力した場合" do
    scenario "パスワードを再設定する" do
      visit new_user_password_path
      expect(page).to have_http_status :ok
      fill_in "user[email]",	with: "test20@example.com"
      expect { click_on 'パスワードの再設定方法を送信する' }.to change { ActionMailer::Base.deliveries.size }.by(1)
      expect(page).to  have_content('パスワードの再設定について数分以内にメールでご連絡いたします。')
      mail = ActionMailer::Base.deliveries.last
      url = extract_confirmation_url(mail)
      visit url
      expect(page).to have_content('パスワードを変更')
      fill_in "user[password]", with: "123456"
      fill_in "user[password_confirmation]", with: "123456"
      click_on("パスワードを変更する")
      expect(page).to have_content('パスワードが正しく変更されました。')
    end
  end


end