FactoryGirl.define do
  factory :invalid_robot, parent: :robot do |f|
    f.status nil
  end
end