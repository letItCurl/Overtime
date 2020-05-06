FactoryGirl.define do
  sequence(:rationale) {|n| "rational-#{n}" }

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

  factory :post_rack, class: "Post" do
    date Date.today
    rationale {generate(:rationale)}
    user 
  end
end
