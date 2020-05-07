require 'rails_helper'

RSpec.describe User, type: :model do
    before do
        @user = FactoryGirl.create(:user)
    end

    describe "Creation" do
        it "can be created" do
            expect(@user).to be_valid
        end
        
    end

    describe "Validation" do 
        it "cannot be created without last_name" do 
            @user.last_name = nil
            expect(@user).to_not be_valid
        end
        it "cannot be created without first_name" do 
            @user.first_name = nil
            expect(@user).to_not be_valid
        end
        it "cannot be created without first_name, last_name" do 
            @user.phone = nil
            expect(@user).to_not be_valid
        end
        it "require the phone attr to only contain integers" do
            @user.phone = "mygreatstr"
            expect(@user).to_not be_valid
        end
        it "require the phone attr to only have 10 char" do
            @user.phone = "1654654564654654"
            expect(@user).to_not be_valid
        end
    end

    describe "custom name methods" do
        it "has a full name method" do
           expect(@user.full_name).to eq("SNOW, JHON") 
        end
    end

end