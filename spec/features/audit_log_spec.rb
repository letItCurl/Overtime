require 'rails_helper'

describe "AuditLog feature" do 
    before do
        @audit_log = FactoryGirl.create(:audit_log)
        @user = FactoryGirl.create(:admin_user)
        login_as(@user, :scope => :user)
    end

    describe 'index' do
        before do
            
        end

        it "has an index page that can be reached" do
            visit audit_logs_path
            expect(page.status_code).to eq(200)
        end
        it 'render audit log content' do
            visit audit_logs_path
            expect(page).to have_content(/SNOW|JHON/)
        end
    
        it "cannot be accessed by non admin users" do
            logout(:user)
            @user = FactoryGirl.create(:user)
            login_as(@user, :scope => :user)
            visit audit_logs_path
            expect(current_path).to eq(root_path)
        end

    end

end
