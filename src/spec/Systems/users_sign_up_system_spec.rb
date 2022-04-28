require 'rails_helper'

RSpec.describe '新規登録の統合テスト' , type: :system do

  context "無効なデータを入力した場合" do
    scenario "登録画面にリダイレクトする" do
      visit new_user_registration_path
      expect(page).to  have_http_status "200"
      fill_in "ユーザー名",	with: ""
      fill_in "Eメール",	with: "user@invalid"
      fill_in "パスワード",	with: "123"
      fill_in "パスワード（確認用）",	with: "145"
      click_button "アカウント登録"
      expect(current_path).to eq user_registration_path
    end
  end

  context "有効なデータを入力した場合" do
    before do
      ActionMailer::Base.deliveries.clear
    end

    def extract_confirmation_url(mail)
      body = mail.body.encoded
      body[/http[^"]+/]
    end

    scenario "正しい情報を入力をしてメール認証に成功する（メーラーテスト）" do
      visit new_user_registration_path
      expect(page).to have_http_status "200"
      fill_in "ユーザー名",	with: "太郎"
      fill_in "Eメール",	with: "test100@example.com"
      fill_in "パスワード",	with: "123456"
      fill_in "パスワード（確認用）",	with: "123456"
      expect { click_button 'アカウント登録' }.to change { ActionMailer::Base.deliveries.size }.by(1)
      expect(page).to have_content('本人確認用のメールを送信しました。メール内のリンクからアカウントを有効化させてください。')
      mail = ActionMailer::Base.deliveries.last
      url = extract_confirmation_url(mail)
      visit url
      expect(page).to have_content('メールアドレスが確認できました。')
    end

    scenario "正しい情報を入力後、アカウント確認メール再送を実行しメール認証に成功する" do
      visit new_user_registration_path
      expect(page).to have_http_status "200"
      fill_in "ユーザー名",	with: "太郎"
      fill_in "Eメール",	with: "test100@example.com"
      fill_in "パスワード",	with: "123456"
      fill_in "パスワード（確認用）",	with: "123456"
      click_button "アカウント登録"
      expect(page).to have_content('本人確認用のメールを送信しました。メール内のリンクからアカウントを有効化させてください。')
      page.all(".menu-list")[1].click #メニューバー アカウント登録
      click_on("アカウント確認のメールを受け取っていませんか？")
      fill_in "user[email]",	with: "test@example.com"
      click_button "アカウント確認メール再送"
      sign_up_mail = ActionMailer::Base.deliveries.last
      mail_body = sign_up_mail.body.encoded
      new_user_session_path = URI.extract(mail_body)[0]
      visit new_user_session_path
      expect(page).to have_content('メールアドレスが確認できました。')
    end
  end
end