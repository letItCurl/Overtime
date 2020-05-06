FactoryGirl.define do
  sequence :email do |n|
    "bot#{n}@mail.com"
  end

  factory :user do
    first_name 'jhon'
    last_name 'snow'
    email {generate :email}
    password "123456789"
    password_confirmation "123456789"

    factory :user_with_posts do
      ignore do
        posts_count 5
      end
      after(:create) do |user, evaluator|
        FactoryGirl.create_list(:post_rack, evaluator.posts_count, user: user)
      end
    end

    factory :user_with_posts_rand do
      ignore do
        posts_count 5
      end
      after(:create) do |user, evaluator|
        FactoryGirl.create_list(:post_rack_random_status, evaluator.posts_count, user: user)
      end
    end
    
  end

  factory :admin_user, class: "AdminUser" do
      first_name 'Admin'
      last_name 'User'
      email {generate :email}
      password "123456789"
      password_confirmation "123456789"
  end

  factory :non_auth, class: "User" do
    first_name 'Non'
    last_name 'Auth'
    email {generate :email}
    password "123456789"
    password_confirmation "123456789"
  end
end
  