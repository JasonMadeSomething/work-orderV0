class Status < ActiveRecord::Base
    validates_presence_of :description
    validates_inclusion_of :description, in: (["Active", "Completed", "On Hold"])
    has_many :work_orders
    validates_uniqueness_of :description
end
