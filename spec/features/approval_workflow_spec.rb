require 'rails_helper'

describe 'Approval workflow:' do 
    before do
        @admin = FactoryGirl.create(:admin_user)
        login_as(@admin, :scope => :user)
    end
    describe 'edit:' do
        before do
            @post = FactoryGirl.create(:post)
            visit edit_post_path(@post)
        end

        it 'has a status that can be edited on the form by an admin' do
            choose "post_status_approved"
            click_on "Save"
            expect(@post.reload.status).to eq('approved')
        end

        it 'cannot be edited by an user' do
            logout :user
            @user = FactoryGirl.create(:user)
            login_as(@user, :scope => :user)

            visit edit_post_path(@post)

            expect(page).to_not have_content('Approved')
        end

        it 'should not be editable by the post creator if status is approved' do
            logout(:user)
            @user = FactoryGirl.create(:user_with_posts)
            login_as(@user, :scope => :user)
            visit posts_path
            @post = @user.posts.last
            @post.approved!
            visit edit_post_path(@post)
            expect(current_path).to eq(root_path)
        end
    end
end

