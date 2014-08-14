class Robot < ActiveRecord::Base
  belongs_to  :world
  has_many    :moves
end
