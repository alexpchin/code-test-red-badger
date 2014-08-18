require "spec_helper"

describe Robot do

  describe "relations" do
    it { should have_many (:moves) }
    it { should belong_to (:world) }
  end

  describe "validations" do
    it { should validate_numericality_of(:status).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(1) }
  end

end