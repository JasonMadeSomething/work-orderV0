class ProductionDetailTab < ActiveRecord::Base
    belongs_to :production_details
    belongs_to :tab
    validates_presence_of :tab_id
    validates_presence_of :production_details_id
end
