require 'rails_helper'

describe 'navigate to' do

    before do 
        @user = FactoryGirl.create(:user)
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
        p1 = FactoryGirl.create(:post)
        p2 = FactoryGirl.create(:second_post)
        visit posts_path # ORDER IS IMPORTANT DUMBASS
        expect(page).to have_content(/P1|P2/)
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
end