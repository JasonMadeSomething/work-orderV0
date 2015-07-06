class PresortInformation < ActiveRecord::Base
    belongs_to :error_record_handling
    belongs_to :deduping_instructions
    belongs_to :work_order
    belongs_to :permit
    belongs_to :mailing_specs
    belongs_to :mail_class
    belongs_to :sortation
    belongs_to :labels
    belongs_to :piece_type
    belongs_to :postage_type
    validates_inclusion_of :suppression, :in => [true, false]
    validates_inclusion_of :dropship, :in => [true, false]
    accepts_nested_attributes_for :error_record_handling, :deduping_instructions, :mailing_specs, :permit
end
