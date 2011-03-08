require 'spec_helper'

describe Shoulda::Matchers::ActiveRecord::ValidateInclusionOfMatcher do

  context "an attribute which must be included" do
    before do
      @model = define_model(:example, :attr => :integer) do
        validates_inclusion_of :attr, :in => [0, 1]
      end.new
    end

    it "should require that attribute to be included" do
      @model.should validate_inclusion_of(:attr).in([0, 1])
    end

    it "should not overwrite the default message with nil" do
      @model.should validate_inclusion_of(:attr).in([0, 1]).with_message(nil)
    end
  end

  context "an attribute that does not need to be included" do
    before do
      @model = define_model(:example, :attr => :integer).new
    end

    it "should not require that attribute to be included" do
      @model.should_not validate_inclusion_of(:attr)
    end
  end

  context "an attribute which must be included with a custom message" do
    before do
      @model = define_model(:example, :attr => :integer) do
        validates_inclusion_of :attr, :in => [0, 1], :message => 'custom'
      end.new
    end

    it "should require that attribute to be included with that message" do
      @model.should validate_inclusion_of(:attr).in([0, 1]).with_message(/custom/)
    end
  end

end
