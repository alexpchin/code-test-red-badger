require "spec_helper"

describe Move do

  # it "has a valid factory" do
  #   expect(build(:move)).to be_valid
  # end

  describe "relations" do
    it { should belong_to (:robot) }
  end

  describe "validations" do
    it { should validate_presence_of(:orientation) }
  end

end