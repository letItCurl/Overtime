require 'rails_helper'

describe 'navigate to' do
  describe 'index:' do
    before do
        @user = User.create(email: "test@mail.com", password:"123456789", password_confirmation:"123456789", first_name: "jhon", last_name:"snow")
        login_as(@user, :scope => :user)
        visit posts_path
    end
    it "can be reached" do
        expect(page.status_code).to eq(200)
    end
    it "has a title of Posts" do
        expect(page).to have_content(/Posts/)
    end
  end

  describe 'creation' do
    before do
        @user = User.create(email: "test@mail.com", password:"123456789", password_confirmation:"123456789", first_name: "jhon", last_name:"snow")
        login_as(@user, :scope => :user)
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