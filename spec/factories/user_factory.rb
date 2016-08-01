FactoryGirl.define do
  sequence :email do |n|
    "ernest#{n}@getrover.co"
  end

  factory :user do
    name 'Ernest Shackleton'
    email
  end
end
