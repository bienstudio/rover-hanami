require 'core_ext/integer/time'

FactoryGirl.define do
  factory :trip do
    name        'Antarctic Expedition'
    start_date  { Date.today }
    end_date    { Date.today + 2.days }
    user_id     { UserRepository.create(build(:user)).id }
  end
end
