require 'shoulda/matchers/active_record/helpers'
require 'shoulda/matchers/active_record/validation_matcher'
require 'shoulda/matchers/active_record/allow_value_matcher'
require 'shoulda/matchers/active_record/allow_range_matcher'
require 'shoulda/matchers/active_record/ensure_length_of_matcher'
require 'shoulda/matchers/active_record/ensure_inclusion_of_matcher'
require 'shoulda/matchers/active_record/validate_presence_of_matcher'
require 'shoulda/matchers/active_record/validate_format_of_matcher'
require 'shoulda/matchers/active_record/validate_uniqueness_of_matcher'
require 'shoulda/matchers/active_record/validate_acceptance_of_matcher'
require 'shoulda/matchers/active_record/validate_numericality_of_matcher'
require 'shoulda/matchers/active_record/validate_inclusion_of_matcher'
require 'shoulda/matchers/active_record/association_matcher'
require 'shoulda/matchers/active_record/have_db_column_matcher'
require 'shoulda/matchers/active_record/have_db_index_matcher'
require 'shoulda/matchers/active_record/have_readonly_attribute_matcher'
require 'shoulda/matchers/active_record/allow_mass_assignment_of_matcher'


module Shoulda
  module Matchers
    # = Matchers for your active record models
    #
    # These matchers will test most of the validations and associations for your
    # ActiveRecord models.
    #
    #   describe User do
    #     it { should validate_presence_of(:name) }
    #     it { should validate_presence_of(:phone_number) }
    #     %w(abcd 1234).each do |value|
    #       it { should_not allow_value(value).for(:phone_number) }
    #     end
    #     it { should allow_value("(123) 456-7890").for(:phone_number) }
    #     it { should_not allow_mass_assignment_of(:password) }
    #     it { should have_one(:profile) }
    #     it { should have_many(:dogs) }
    #     it { should have_many(:messes).through(:dogs) }
    #     it { should belong_to(:lover) }
    #   end
    #
    module ActiveRecord
    end
  end
end
