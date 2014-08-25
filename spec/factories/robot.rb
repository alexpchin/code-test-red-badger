FactoryGirl.define do
  factory :robot do
    ## attributes
    status { rand(0..1) } 
    world_id { rand(0..10) }

    ## associations
    world
  end
end