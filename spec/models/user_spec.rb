require 'rails_helper'

RSpec.describe User, type: :model do
    before do
        @user = FactoryGirl.create(:user)
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
        it "cannot be created without first_name, last_name" do 
            @user.phone = nil
            expect(@user).to_not be_valid
        end
    end

    describe "custom name methods" do
        it "has a full name method" do
           expect(@user.full_name).to eq("SNOW, JHON") 
        end
    end

end