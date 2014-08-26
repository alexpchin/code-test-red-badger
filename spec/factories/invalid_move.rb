FactoryGirl.define do
  factory :invalid_move, parent: :move do |f|
    f.status nil
  end
end