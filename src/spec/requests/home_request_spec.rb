require 'rails_helper'

RSpec.describe "HomeController", type: :request do

  let(:user) {FactoryBot.create(:user)}

  describe "#home/index" do
    context "権限を有するユーザーの場合" do
      it "正常なレスポンスか？" do
        sign_in user
        get root_path
        expect(response).to be_truthy
      end
      it "200レスポンスが返ってきているか？" do
        sign_in user
        get root_path
        expect(response).to have_http_status "200"
      end
    end
    context "権限を有しないユーザーの場合" do
      it "正常にレスポンスが返ってきていないか？" do
        get root_path
        expect(response).to be_truthy
      end
    end
  end

end