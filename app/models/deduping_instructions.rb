class DedupingInstructions < ActiveRecord::Base
    validates_presence_of :name, :instruction
    validates_uniqueness_of :name, :instruction
end
