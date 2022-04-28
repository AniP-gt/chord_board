require 'rails_helper'

RSpec.describe "Relationships", type: :request do

  let(:user) {FactoryBot.create(:user)}
  let(:other_user) {FactoryBot.create(:user)}

  describe "#Relationships/create" do
    before do
      sign_in user
    end
    it "Relationshipの数が1件増えること" do
      expect { post user_relationships_path(other_user.id), params: {followed_id: other_user.id}}.to change(Relationship, :count).by 1
    end
    # it "Relationshipの数が1件増えること(Ajax)" do
    #   expect { post user_relationships_path(other_user.id), params: {followed_id: other_user.id}, xhr:true}.to change(Relationship, :count).by 1
    # end
    it "フォローした後、リファラーページにリダイレクトすること" do
      post user_relationships_path(other_user.id)
      expect(response).to redirect_to root_url
    end
  end

  describe "#Relationships/destory" do
    before do
      sign_in user
    end

    it "Relationshipの数が1件減ること" do
      user.follow(other_user.id)
      expect { delete user_relationships_path(other_user.id), params: {followed_id: other_user.id}}.to change(Relationship, :count).by -1
    end
    # it "Relationshipの数が1件減ること" do
    #   user.follow(other_user.id)
    #   expect { delete user_relationships_path(other_user.id), params: {followed_id: other_user.id}, xhr:true}.to change(Relationship, :count).by -1
    # end
    it "フォロー解除後、リファラーページにリダイレクトすること" do
      user.follow(other_user.id)
      delete user_relationships_path(other_user.id)
      expect(response).to redirect_to root_url
    end

  end


end
