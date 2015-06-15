class DedupingInstructions < ActiveRecord::Base
    validates_presence_of :name, :instruction
    validates_uniqueness_of :name, :instruction
    has_many :presort_informations
end
