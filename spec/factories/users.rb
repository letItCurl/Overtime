FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@mail.com"
  end
  factory :user do
    first_name 'jhon'
    last_name 'snow'
    email {generate :email}
    password "123456789"
    password_confirmation "123456789"
  end

  factory :admin_user, class: "AdminUser" do
      first_name 'Admin'
      last_name 'User'
      email {generate :email}
      password "123456789"
      password_confirmation "123456789"
  end
end
  