require 'spec_helper'

describe Shoulda::Matchers::ActionController::HaveFilterMatcher do

  context "a controller that has filters" do

    before do
      @controller_class = define_controller("HasFiltersController") do
        before_filter :a_before_filter
        after_filter  :an_after_filter
        around_filter :an_around_filter

        before_filter :a_single_only_before_filter, :only => :new
        after_filter  :a_single_only_after_filter,  :only => :new
        around_filter :a_single_only_around_filter, :only => :new

        before_filter :a_multi_only_before_filter, :only => [:new, :create]
        after_filter  :a_multi_only_after_filter,  :only => [:new, :create]
        around_filter :a_multi_only_around_filter, :only => [:new, :create]

        before_filter :a_single_except_before_filter, :except => :new
        after_filter  :a_single_except_after_filter,  :except => :new
        around_filter :a_single_except_around_filter, :except => :new

        before_filter :a_multi_except_before_filter, :except => [:new, :create]
        after_filter  :a_multi_except_after_filter,  :except => [:new, :create]
        around_filter :a_multi_except_around_filter, :except => [:new, :create]

        def a_before_filter;  end
        def an_after_filter;  end
        def an_around_filter; end

        def a_single_only_before_filter;  end
        def a_single_only_after_filter;  end
        def a_single_only_around_filter; end

        def a_multi_only_before_filter;  end
        def a_multi_only_after_filter;  end
        def a_multi_only_around_filter; end

        def a_single_except_before_filter;  end
        def a_single_except_after_filter;  end
        def a_single_except_around_filter; end

        def a_multi_except_before_filter;  end
        def a_multi_except_after_filter;  end
        def a_multi_except_around_filter; end
      end

      @controller = @controller_class.new
    end

    it "should accept having filters with the correct name" do
      @controller.should have_filter(:a_before_filter)
      @controller.should have_filter(:an_after_filter)
      @controller.should have_filter(:an_around_filter)

      @controller.should have_filter(:a_single_only_before_filter)
      @controller.should have_filter(:a_single_only_after_filter)
      @controller.should have_filter(:a_single_only_around_filter)

      @controller.should have_filter(:a_multi_only_before_filter)
      @controller.should have_filter(:a_multi_only_after_filter)
      @controller.should have_filter(:a_multi_only_around_filter)

      @controller.should have_filter(:a_single_except_before_filter)
      @controller.should have_filter(:a_single_except_after_filter)
      @controller.should have_filter(:a_single_except_around_filter)

      @controller.should have_filter(:a_multi_except_before_filter)
      @controller.should have_filter(:a_multi_except_after_filter)
      @controller.should have_filter(:a_multi_except_around_filter)
    end

    it "should accept having filters with the correct name and kind" do
      @controller.should have_filter(:a_before_filter).of_kind(:before)
      @controller.should have_filter(:an_after_filter).of_kind(:after)
      @controller.should have_filter(:an_around_filter).of_kind(:around)

      @controller.should have_filter(:a_single_only_before_filter).of_kind(:before)
      @controller.should have_filter(:a_single_only_after_filter).of_kind(:after)
      @controller.should have_filter(:a_single_only_around_filter).of_kind(:around)

      @controller.should have_filter(:a_multi_only_before_filter).of_kind(:before)
      @controller.should have_filter(:a_multi_only_after_filter).of_kind(:after)
      @controller.should have_filter(:a_multi_only_around_filter).of_kind(:around)

      @controller.should have_filter(:a_single_except_before_filter).of_kind(:before)
      @controller.should have_filter(:a_single_except_after_filter).of_kind(:after)
      @controller.should have_filter(:a_single_except_around_filter).of_kind(:around)

      @controller.should have_filter(:a_multi_except_before_filter).of_kind(:before)
      @controller.should have_filter(:a_multi_except_after_filter).of_kind(:after)
      @controller.should have_filter(:a_multi_except_around_filter).of_kind(:around)
    end

    it "should reject having filters with the incorrect name" do
      @controller.should_not have_filter(:nonexistent_filter)
    end

    it "should reject having filters with the incorrect name and kind" do
      @controller.should_not have_filter(:a_before_filter).of_kind(:after)
      @controller.should_not have_filter(:a_before_filter).of_kind(:around)

      @controller.should_not have_filter(:an_after_filter).of_kind(:before)
      @controller.should_not have_filter(:an_after_filter).of_kind(:around)

      @controller.should_not have_filter(:an_around_filter).of_kind(:before)
      @controller.should_not have_filter(:an_around_filter).of_kind(:after)

      @controller.should_not have_filter(:nonexistent_filter).of_kind(:before)
      @controller.should_not have_filter(:nonexistent_filter).of_kind(:after)
      @controller.should_not have_filter(:nonexistent_filter).of_kind(:around)
    end

    it "should accept having filters with the correct options" do
      @controller.should have_filter(:a_single_only_before_filter).only_on(:new)
      @controller.should have_filter(:a_single_only_after_filter).only_on(:new)
      @controller.should have_filter(:a_single_only_around_filter).only_on(:new)

      @controller.should have_filter(:a_multi_only_before_filter).only_on(:new, :create)
      @controller.should have_filter(:a_multi_only_after_filter).only_on(:new, :create)
      @controller.should have_filter(:a_multi_only_around_filter).only_on(:new, :create)

      @controller.should have_filter(:a_single_except_before_filter).except_on(:new)
      @controller.should have_filter(:a_single_except_after_filter).except_on(:new)
      @controller.should have_filter(:a_single_except_around_filter).except_on(:new)

      @controller.should have_filter(:a_multi_except_before_filter).except_on(:new, :create)
      @controller.should have_filter(:a_multi_except_after_filter).except_on(:new, :create)
      @controller.should have_filter(:a_multi_except_around_filter).except_on(:new, :create)
    end

    it "should accept having filters with the correct kind and options" do
      @controller.should have_filter(:a_single_only_before_filter).of_kind(:before).only_on(:new)
      @controller.should have_filter(:a_single_only_after_filter).of_kind(:after).only_on(:new)
      @controller.should have_filter(:a_single_only_around_filter).of_kind(:around).only_on(:new)

      @controller.should have_filter(:a_multi_only_before_filter).of_kind(:before).only_on(:new, :create)
      @controller.should have_filter(:a_multi_only_after_filter).of_kind(:after).only_on(:new, :create)
      @controller.should have_filter(:a_multi_only_around_filter).of_kind(:around).only_on(:new, :create)

      @controller.should have_filter(:a_single_except_before_filter).of_kind(:before).except_on(:new)
      @controller.should have_filter(:a_single_except_after_filter).of_kind(:after).except_on(:new)
      @controller.should have_filter(:a_single_except_around_filter).of_kind(:around).except_on(:new)

      @controller.should have_filter(:a_multi_except_before_filter).of_kind(:before).except_on(:new, :create)
      @controller.should have_filter(:a_multi_except_after_filter).of_kind(:after).except_on(:new, :create)
      @controller.should have_filter(:a_multi_except_around_filter).of_kind(:around).except_on(:new, :create)
    end
    
    it "should not accept having filters with the incorrect options" do
      @controller.should_not have_filter(:a_single_only_before_filter).only_on(:edit)
      @controller.should_not have_filter(:a_single_only_after_filter).only_on(:edit)
      @controller.should_not have_filter(:a_single_only_around_filter).only_on(:edit)

      @controller.should_not have_filter(:a_multi_only_before_filter).only_on(:edit, :create)
      @controller.should_not have_filter(:a_multi_only_after_filter).only_on(:edit, :create)
      @controller.should_not have_filter(:a_multi_only_around_filter).only_on(:edit, :create)

      @controller.should_not have_filter(:a_single_except_before_filter).except_on(:edit)
      @controller.should_not have_filter(:a_single_except_after_filter).except_on(:edit)
      @controller.should_not have_filter(:a_single_except_around_filter).except_on(:edit)

      @controller.should_not have_filter(:a_multi_except_before_filter).except_on(:edit, :create)
      @controller.should_not have_filter(:a_multi_except_after_filter).except_on(:edit, :create)
      @controller.should_not have_filter(:a_multi_except_around_filter).except_on(:edit, :create)
    end

    it "should not accept having filters with the incorrect kind and options" do
      @controller.should_not have_filter(:a_single_only_before_filter).of_kind(:after).only_on(:edit)
      @controller.should_not have_filter(:a_single_only_after_filter).of_kind(:around).only_on(:edit)
      @controller.should_not have_filter(:a_single_only_around_filter).of_kind(:before).only_on(:edit)

      @controller.should_not have_filter(:a_multi_only_before_filter).of_kind(:after).only_on(:edit, :update)
      @controller.should_not have_filter(:a_multi_only_after_filter).of_kind(:around).only_on(:edit, :update)
      @controller.should_not have_filter(:a_multi_only_around_filter).of_kind(:before).only_on(:edit, :update)

      @controller.should_not have_filter(:a_single_except_before_filter).of_kind(:after).except_on(:edit)
      @controller.should_not have_filter(:a_single_except_after_filter).of_kind(:around).except_on(:edit)
      @controller.should_not have_filter(:a_single_except_around_filter).of_kind(:before).except_on(:edit)

      @controller.should_not have_filter(:a_multi_except_before_filter).of_kind(:after).except_on(:edit, :update)
      @controller.should_not have_filter(:a_multi_except_after_filter).of_kind(:around).except_on(:edit, :update)
      @controller.should_not have_filter(:a_multi_except_around_filter).of_kind(:before).except_on(:edit, :update)
    end
  end
end
