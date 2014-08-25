FactoryGirl.define do
  factory :world do
    ## attributes
    name { Faker::Name.name } 
    x { rand(0..50) }
    y { rand(0..50) }

    ## associations
    world
  end
end