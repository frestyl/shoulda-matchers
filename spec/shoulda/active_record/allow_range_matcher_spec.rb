require 'spec_helper'

describe Shoulda::Matchers::ActiveRecord::AllowRangeMatcher do

  context "an attribute with an inclusion validation" do
    before do
      define_model :example, :attr => :integer do
        validates_inclusion_of :attr, :in => [0, 1]
      end
      @model = Example.new
    end

    it "should allow a good range" do
      @model.should allow_range([0, 1]).for(:attr)
    end

    it "should not allow a bad value" do
      @model.should_not allow_range([2, 3]).for(:attr)
    end

    it "should not allow a bad type value" do
      lambda {
        @model.should allow_range("xyz").for(:attr)
      }.should raise_error
    end
  end

end
