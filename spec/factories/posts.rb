FactoryGirl.define do
  factory :post do
    date Date.today
    rationale "P1"
    user
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "P2"
    user
  end
end
