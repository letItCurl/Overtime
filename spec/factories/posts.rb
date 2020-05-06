FactoryGirl.define do
  def status
    status_map={
        0 => "submitted",
        1 => "approved",
        2 => "rejected"
    }
    status_map[rand(0..2.5).floor]
  end

  sequence(:rationale) {|n| "rational-#{n}" }
  sequence(:status) { status }
  sequence(:overtime_request) { rand(1..2.9) }

  factory :post do
    overtime_request {generate(:overtime_request)}
    date Date.today
    rationale "P1"
    user
  end

  factory :second_post, class: "Post" do
    overtime_request {generate(:overtime_request)}
    date Date.yesterday
    rationale "P2"
    user 
  end

  factory :post_rack, class: "Post" do
    overtime_request {generate(:overtime_request)}
    date Date.today
    rationale {generate(:rationale)}
    user 
  end

  factory :post_rack_random_status, class: "Post" do
    overtime_request {generate(:overtime_request)}
    date Date.today
    rationale {generate(:rationale)}
    status {generate :status}
    user 
  end
end
