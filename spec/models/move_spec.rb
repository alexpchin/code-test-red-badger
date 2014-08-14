require "spec_helper"

describe Move do
  describe "relations" do
    it { should belong_to (:robot) }
  end
end