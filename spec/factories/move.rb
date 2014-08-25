FactoryGirl.define do
  factory :move do
    ## attributes
    orientation { ["n","s","e","w"].sample } 
    x { rand(0..50) }
    y { rand(0..50) }
    robot_id { rand(0..50) }
    status { rand(0..1) }

    ## associations
    robot
  end
end