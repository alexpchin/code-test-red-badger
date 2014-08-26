FactoryGirl.define do
  factory :invalid_world, parent: :world do |f|
    f.x nil
  end
end