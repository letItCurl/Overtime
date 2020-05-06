require 'rails_helper'

describe 'navigate to' do

    before do 
        @user = FactoryGirl.create(:user_with_posts)
        login_as(@user, :scope => :user)
    end

  describe 'index:' do
    before do
        visit posts_path
    end
    it "can be reached" do
        expect(page.status_code).to eq(200)
    end
    it "has a title of Posts" do
        expect(page).to have_content(/Posts/)
    end
    it "has a list of posts" do 
        visit posts_path # ORDER IS IMPORTANT DUMBASS
        expect(page).to have_content(/#{@user.posts.pluck(:rationale).join("|")}/)
    end
    it "has can't see list of other user posts" do 
        logout(:user)
        @user_2 = FactoryGirl.create(:user)
        login_as(@user_2, :scope => :user)
        visit posts_path # ORDER IS IMPORTANT DUMBASS
        expect(page).to_not have_content(/#{@user.posts.pluck(:rationale).join("|")}/)
    end
  end

  describe "new" do
    it "has a link from the home page" do 
        visit root_path
        click_link('new_post_nav_link')
        expect(page.status_code).to eq(200)
    end
  end

  describe "delete" do
    it "can be deleted" do
        @post = @user.posts.first
        visit posts_path
        click_link("delete_post_#{@post.id}_link")
        expect(page).to_not have_content(@post.rationale)
        expect(@user.reload.posts).to_not include(@post)
    end
  end
  describe 'creation' do
    before do
        visit new_post_path
    end
    it "has a new form that can be reached" do
        expect(page.status_code).to eq(200)
    end
    it "can be created from new from page" do
        fill_in 'post[date]', with: Date.today
        fill_in 'post[rationale]', with: "Some rationale"
        click_on "Save"
        expect(page).to have_content("Some rationale")
    end
    it "will have a user associated" do
        fill_in 'post[date]', with: Date.today
        fill_in 'post[rationale]', with: "User_Association"
        click_on "Save"
        expect(User.last.posts.last.rationale).to eq("User_Association")
    end
  end

  describe 'edit' do
    before do
        logout :user
        @user = FactoryGirl.create(:user_with_posts)
        @post = @user.posts.first
        login_as(@user, :scope => :user)
    end
    it 'can be reached by clicking edit on index page' do
        visit posts_path
        click_link("edit_#{@post.id}") #capybara
        expect(page.status_code).to eq(200)
    end
    it "can be edited" do
        visit edit_post_path(@post)

        fill_in 'post[date]', with: Date.today
        fill_in 'post[rationale]', with: "Some rationale"
        click_on "Save"
        
        expect(page.status_code).to eq(200)
    end
    it "cannot be edit by non auth(pundit) user" do 
        logout :user
        @non_auth = FactoryGirl.create(:non_auth)
        login_as(@non_auth, :scope => :user)
        visit edit_post_path(@post)
        expect(current_path).to eq(root_path)
    end

  end

end