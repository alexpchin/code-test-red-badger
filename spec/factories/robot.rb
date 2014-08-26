FactoryGirl.define do
  factory :robot do |f|
    ## attributes
    f.status { rand(0..1) } 
    f.world_id { rand(1..10) }

    ## associations
    f.world
  end
end