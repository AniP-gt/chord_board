require 'rails_helper'

RSpec.describe "UsersController", type: :request do

  let(:user) {FactoryBot.create(:user)}
  let(:other_user) {FactoryBot.create(:user)}

  describe "#user/index" do
    context "権限を有するユーザーの場合" do
      before do
        sign_in user
      end
      it "正常なレスポンスか？" do
        get users_path
        expect(response).to be_truthy
      end
      it "200レスポンスが返ってきているか？" do
        get users_path
        expect(response).to have_http_status "200"
      end
    end
    context "権限を有しないユーザーの場合" do
      it "正常にレスポンスが返ってきていないか？" do
        get users_path
        expect(response).to be_truthy
      end
      it "302レスポンスが返ってきているか？" do
        get users_path
        expect(response).to have_http_status "302"
      end
      it "ログイン画面にリダイレクトされているか？" do
        get users_path
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end


  describe "#user/show" do
    context "権限を有するユーザーの場合" do
      before do
        sign_in user
      end
      it "正常なレスポンスか？" do
        get user_path user.id
        expect(response).to be_truthy
      end
      it "200レスポンスが返ってきているか？" do
        get user_path user.id
        expect(response).to have_http_status "200"
      end
    end
    context "権限を有しないユーザーの場合" do
      it "正常にレスポンスが返ってきていないか？" do
        get user_path user.id
        expect(response).to be_truthy
      end
      it "302レスポンスが返ってきているか？" do
        get user_path user.id
        expect(response).to have_http_status "302"
      end
      it "ログイン画面にリダイレクトされているか？" do
        get user_path user.id
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end


  describe "#user/edit" do
    context "権限を有するユーザーの場合" do
      before do
        sign_in user
      end
      it "正常にレスポンスが返ってきていないか？" do
        get edit_user_path user.id
        expect(response).to  be_truthy
      end
      it "200レスポンスが返ってきているか？"do
        get edit_user_path user.id
        expect(response).to have_http_status "200"
      end
      it "不正なアクセスによるため、users/index画面にリダイレクトされるか？" do
        get edit_user_path other_user.id
        expect(response).to redirect_to users_path
      end
    end
    context "権限を有しないユーザーの場合" do
      it "正常にレスポンスが返ってきていないか？" do
        get edit_user_path user.id
        expect(response).to be_truthy
      end
      it "302レスポンスが返ってきているか？" do
        get edit_user_path user.id
        expect(response).to have_http_status "302"
      end
      it "ログイン画面にリダイレクトされているか？" do
        get edit_user_path user.id
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end

  describe "#user/following" do
    before do
      sign_in user
    end
    it "正常なレスポンスか？" do
      get following_user_path user.id
      expect(response).to be_truthy
    end
    it "200レスポンスが返ってきているか？" do
      get following_user_path user.id
      expect(response).to have_http_status "200"
    end
  end

  describe "#user/follower" do
    before do
      sign_in user
    end
    it "正常なレスポンスか？" do
      get followers_user_path user.id
      expect(response).to be_truthy
    end
    it "200レスポンスが返ってきているか？" do
      get followers_user_path user.id
      expect(response).to have_http_status "200"
    end
  end

  describe "#user/favorite" do
    before do
      sign_in user
    end
    it "正常なレスポンスか？" do
      get favorites_user_path user.id
      expect(response).to be_truthy
    end
    it "200レスポンスが返ってきているか？" do
      get favorites_user_path user.id
      expect(response).to have_http_status "200"
    end
  end
end