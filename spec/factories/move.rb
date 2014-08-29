FactoryGirl.define do
  factory :move do |f|
    ## attributes
    f.orientation { ['n','s','e','w'].sample } 
    f.x { rand(0..50) }
    f.y { rand(0..50) }
    f.robot_id { rand(1..50) }
    f.status { rand(0..1) }

    ## associations
    f.robot
  end
end