require 'rails_helper'

describe "Homepage" do 
    before do
        @user = FactoryGirl.create(:admin_user)
        @post = FactoryGirl.create(:post)
        login_as(@user, :scope => :user)
    end
    it 'review on click should lead to edit path' do 
        visit root_path
        click_on "review_btn_#{@post.id}"

        expect(current_path).to eq(edit_post_path(@post.id))
    end
    it 'allow the admin to approve posts from the home page' do 
        visit root_path
        click_on "approve_btn_#{@post.id}"

        expect(@post.reload.status).to eq("approved")
    end
    it 'protect an non-admin from auto-approve his overtime request' do
        logout(:user)
        @user = FactoryGirl.create(:user_with_posts)
        @post = @user.posts.last
        login_as(@user, :scope => :user)
        visit approve_post_path(@post)
        expect(@post.reload.status).to_not eq("approved")
    end
    it 'allow the admin to approve posts from the home page' do 
        logout(:user)
        @user = FactoryGirl.create(:user)
        @audit_log = FactoryGirl.create(:audit_log, user: @user)
        @audit_log.pending!
        login_as(@user, :scope => :user)        
        visit root_path
        click_on "confirm_#{@audit_log.id}"
        expect(@audit_log.reload.status).to eq('confirmed')
    end
end