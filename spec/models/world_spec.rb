require "spec_helper"

describe World do
  describe "relations" do
    it { should have_many (:robots) }
  end
end