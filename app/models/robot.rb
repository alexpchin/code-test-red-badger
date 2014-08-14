class Robot < ActiveRecord::Base
  belongs_to  :planet
  has_many    :moves
end
