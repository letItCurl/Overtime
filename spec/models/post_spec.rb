require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Creation" do
    before do
      @user = User.create(email: "test@mail.com", password:"123456789", password_confirmation:"123456789", first_name: "jhon", last_name:"snow")
      @post = Post.create(date: Date.today, rationale: "Anything", user_id: @user.id)
      login_as(@user, :scope => :user)
    end
    it "can be created" do
      expect(@post).to be_valid 
    end
    it "cannot be created without date and rationale" do
      @post.rationale = nil
      @post.date = nil
      expect(@post).to_not be_valid
    end
  end
end
