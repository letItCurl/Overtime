require 'rails_helper'

RSpec.describe User, type: :model do
    before do
        @user = User.create(email: "test@mail.com", password:"123456789", password_confirmation:"123456789", first_name: "jhon", last_name:"snow")
    end

    describe "Creation" do
        it "can be created" do
            expect(@user).to be_valid
        end
        it "cannot be created without first_name, last_name" do 
            @user.last_name = nil
            @user.first_name = nil
            expect(@user).to_not be_valid
        end
    end

    describe "custom name methods" do
        it "has a full name method" do
           expect(@user.full_name).to eq("SNOW, JHON") 
        end
    end

end