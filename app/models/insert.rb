class Insert < ActiveRecord::Base
        has_many :production_detail_inserts
        validates :machine, :hand, :inclusion => {:in => [true, false]}
        validates_presence_of :description
end
