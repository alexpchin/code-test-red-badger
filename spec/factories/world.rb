FactoryGirl.define do
  factory :world do |f|
    ## attributes
    f.name { Faker::Name.first_name }
    f.x { rand(0..50) }
    f.y { rand(0..50) }

    ## associations
  end
end