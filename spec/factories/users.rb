FactoryGirl.define do
    factory :user do
      first_name 'jhon'
      last_name 'snow'
      email "test@mail.com"
      password "123456789"
      password_confirmation "123456789"
    end
  
    factory :admin_user, class: "AdminUser" do
        first_name 'Admin'
        last_name 'User'
        email "admin@user.com"
        password "123456789"
        password_confirmation "123456789"
    end
  end
  