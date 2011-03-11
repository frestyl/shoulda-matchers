module Shoulda # :nodoc:
  module Matchers
    module ActionController # :nodoc:

      # Ensures that the controller has the specified filters
      #
      # Example:
      #
      #   it { should have_filter(:login_required) }
      #   it { should have_filter(:find_user).of_kind(:before) }
      #   it { should have_filter(:find_user).of_kind(:before).except_on(:new, :create) }
      def have_filter(name)
        HaveFilterMatcher.new(name)
      end

      class HaveFilterMatcher # :nodoc:

        def initialize(name)
          @name = name.to_s
        end
        
        def of_kind(kind)
          @filter_kind = kind
          self
        end
        
        def except_on(*actions)
          @except = (actions.length > 1 ? actions : actions.first)
          self
        end
        
        def only_on(*actions)
          @only = (actions.length > 1 ? actions : actions.first)
          self
        end

        def matches?(controller)
          @controller = controller
          has_filter?
        end

        def failure_message
          preposition = if @filter_kind 
            (@filter_kind.to_s[0].chr =~ /[aeiou]/ ? "an #{@filter_kind}" : "a #{@filter_kind}")
          else
            "a"
          end
          "Expected #{@name} to be declared as #{preposition} filter#{@only ? ", only on #{@only.inspect}" : ""}#{@except ? ", except on #{@except.inspect}" : ""}"
        end

        def negative_failure_message
          preposition = if @filter_kind 
            (@filter_kind.to_s[0].chr =~ /[aeiou]/ ? "an #{@filter_kind}" : "a #{@filter_kind}")
          else
            "a"
          end
          "Did not expect #{@name} to be declared as #{preposition} filter#{@only ? ", only on #{@only.inspect}" : ""}#{@except ? ", except on #{@except.inspect}" : ""}"
        end

        def description
          "has #{@filter_kind ? "#{@filter_kind} " : ""}filter: #{@name} only: #{@only.inspect} except: #{@except.inspect}"
        end

        private

        def has_filter?
          (filter = find_filter(@name, @filter_kind))      && 
          (!@except || filter.options[:except] == @except) && 
          (!@only   || filter.options[:only]   == @only)
        end

        def find_filter(name, kind = nil)
          @controller._process_action_callbacks.find { |filter| (kind ? filter.kind == kind.to_sym : true) && filter.raw_filter == name.to_sym }
        end
      end

    end
  end
end
