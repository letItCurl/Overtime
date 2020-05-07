FactoryGirl.define do
  factory :audit_log do
    user
    status 1
    start_date (Date.today - 6.days)
    end_date nil
    factory :audit_log_salted do
      start_date nil
    end
  end
end
