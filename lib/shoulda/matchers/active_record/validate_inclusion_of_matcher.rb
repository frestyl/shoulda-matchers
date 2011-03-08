module Shoulda # :nodoc:
  module Matchers
    module ActiveRecord # :nodoc:

      # Ensures that the model cannot be saved the given attribute is not
      # included in the given range.
      #
      # Options:
      # * <tt>in</tt> - value the test expects to find in.
      # * <tt>with_message</tt> - value the test expects to find in
      #   <tt>errors.on(:attribute)</tt>. Regexp or string.  Defaults to the
      #   translation for <tt>:inclusion</tt>.
      #
      # Example:
      #   it { should validate_inclusion_of(:gender).in(%w(m f)) }
      #   it { should validate_inclusion_of(:age).in(18..99) }
      #
      def validate_inclusion_of(attr)
        ValidateInclusionOfMatcher.new(attr)
      end

      class ValidateInclusionOfMatcher < ValidationMatcher # :nodoc:

        def with_message(message)
          @expected_message = message if message
          self
        end

        def in(range)
          @range = range
          self
        end

        def matches?(subject)
          super(subject)
          @expected_message ||= :inclusion
          allows_range_of(@range, @expected_message) if @range
        end

        def description
          "require #{@attribute} to be included in #{@range}"
        end

      end

    end
  end
end
