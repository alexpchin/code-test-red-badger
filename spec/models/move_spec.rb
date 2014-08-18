require "spec_helper"

describe Move do

  describe "relations" do
    it { should belong_to (:robot) }
    it { should belong_to (:world) }
  end

  describe "validations" do
    it { should validate_presence_of(:orientation) }
  end

end