require "spec_helper"
require "shoulda/matchers"

describe World do
  
  # it "has a valid factory" do
  #   expect(build(:world)).to be_valid
  # end

  describe "relations" do
    it { should have_many (:robots) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should ensure_length_of(:name).is_at_least(1).is_at_most(30) } 
    it { should validate_numericality_of(:x).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(50) }
    it { should validate_numericality_of(:y).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(50) }
    it { should validate_presence_of(:x) }
    it { should validate_presence_of(:y) }

    # it { should allow_value('/\A[a-zA-Z0-9]+\Z/').for(:name) }
  end

end