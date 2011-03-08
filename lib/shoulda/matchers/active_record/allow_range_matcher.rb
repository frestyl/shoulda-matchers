module Shoulda # :nodoc:
  module Matchers
    module ActiveRecord # :nodoc:

      # Ensures that the attribute can be set to the given range.
      #
      # Options:
      # * <tt>with_message</tt> - value the test expects to find in
      #   <tt>errors.on(:attribute)</tt>. Regexp or string. If omitted,
      #   the test looks for any errors in <tt>errors.on(:attribute)</tt>.
      #
      # Example:
      #   it { should_not allow_range('x').for(:gender) }
      #   it { should allow_range(0..99).for(:age) }
      #
      def allow_range(value)
        AllowRangeMatcher.new(value)
      end

      class AllowRangeMatcher < AllowValueMatcher # :nodoc:
        private

        def assign_value_for(instance, attribute, value)
          instance.send("#{attribute}=", value_for_attribute(value))
        end

        def value_for_attribute(value)
          case value
          when Array
            value.first
          when Range
            value_for_attribute(value.to_a)
          else
            raise "unknown range type: expected Array or Range."
          end
        end
      end

    end
  end
end
