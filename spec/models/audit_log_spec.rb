require 'rails_helper'

RSpec.describe AuditLog, type: :model do
  
  before do
    @audit_log = FactoryGirl.create(:audit_log)
  end
  
  describe 'creation' do
    it 'can be properly created' do
      expect(@audit_log).to be_valid
    end
  end

  describe 'validation' do 
  
    it 'it should requied to have a user association' do
      @audit_log.user_id = nil
      expect(@audit_log).to_not be_valid
    end
  
    it 'it should have a status' do
      @audit_log.status = nil
      expect(@audit_log).to_not be_valid
    end

    it 'it should have a date' do
      @audit_log.start_date = nil
      expect(@audit_log).to_not be_valid
    end

    it 'it should have a start date equal to 6days prior' do
      salted_audit_log = AuditLog.create(user_id: User.last.id)
      #salted_audit_log = FactoryGirl.create(:audit_log_salted)
      expect(salted_audit_log.start_date).to eq(Date.today - 6.days)
    end
  end
end