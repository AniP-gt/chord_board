class TestMailer < ApplicationMailer

  def send_mail
      mail_info = {
        to: Rails.application.credentials.gmail[:user_name],
        from: '認証メール<chord-board@gmail.com>',
        from_display_name: 'ChordBoard',
        subject: 'ChordBoard運営です',
        body: '本メールはChordBoardからのテストメールです。'
      }

    # from及びdisplay_nameをActionMailerで使用する型に変換
    from = Mail::Address.new mail_info['from']
    from.display_name = mail_info['from_display_name']

    # mailメソッドでsubject(メールタイトル)・from(送信元)・to(送信先)を指定
    mail(subject: mail_info['subject'], from: from.format, to: mail_info['to']) do |format|
      format.text { render plain: mail_info['body'] }
    end

  end
end