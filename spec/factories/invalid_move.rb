FactoryGirl.define do
  factory :invalid_move, parent: :move do |f|
    f.orientation { 1 }
  end
end