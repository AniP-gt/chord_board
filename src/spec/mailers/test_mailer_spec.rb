require 'rails_helper'

# RSpec.describe TestMailer, type: :mailer do

#   describe '#mailers' do
#     # メール送信処理を行い、値として送信したメールの情報を保持
#     subject(:mail) do
#       described_class.send_mail.deliver_now
#       ActionMailer::Base.deliveries.last
#     end

#     context 'メールを送信した時に以下の値に等しいこと' do
#       it { expect(mail.from.first).to eq('認証メール<chord-board@gmail.com>') }
#       it { expect(mail.to.first).to eq('test@example.com') }
#       it { expect(mail.subject).to eq('ChordBoard運営です') }
#       it { expect(mail.body).to match(/本メールはChordBoardからのテストメールです。/) }
#     end
#   end

# end

# RSpec.describe "Users::Mailer", type: :mailer do

#   describe "#users/mailer" do
#     email = Users::Mailer.create
#   end


# end