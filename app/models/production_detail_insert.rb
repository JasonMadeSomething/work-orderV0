class ProductionDetailInsert < ActiveRecord::Base
    belongs_to :production_details
    belongs_to :insert
    validates_presence_of :insert_id
    validates_presence_of :production_details_id
end
