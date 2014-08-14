require "spec_helper"

describe Robot do
  describe "relations" do
    it { should have_many (:moves) }
    it { should belong_to (:world) }
  end
end