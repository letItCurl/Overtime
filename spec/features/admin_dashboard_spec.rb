require 'rails_helper'

describe "dashboard:" do 
    it "admin can go to admin dashboard" do
        admin = FactoryGirl.create(:admin_user)
        login_as(admin, :scope => :user)
        visit admin_root_path
        expect(current_path).to eq(admin_root_path)
    end
    it "users not signed in are redirected" do
        visit admin_root_path
        expect(current_path).to eq(new_user_session_path)
    end
    it "user cannot go to admin dashboard" do
        user = FactoryGirl.create(:user)
        login_as(user, :scope => :user)
        visit admin_root_path
        expect(current_path).to eq(root_path)
    end
end
