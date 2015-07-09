class Status < ActiveRecord::Base
    validates_presence_of :description
    validates_inclusion_of :description, in: (["Active", "Completed", "On Hold", "Delete"])
    has_many :work_orders
    validates_uniqueness_of :description
    
    def self.status_id_collection
        arr = []
        Status.all.each do |status|
            tempArr = []
            tempArr << status.id
            tempArr << status.description
            arr << tempArr
        end
        arr
    end
end
