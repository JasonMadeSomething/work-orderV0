class PrintingInstructions < ActiveRecord::Base
    belongs_to :work_order
    validates_presence_of :work_order_id
    validates_presence_of :paperStock,  :nUp
    validates :duplex, :color, :variableData, :inclusion => {:in => [true, false]}
end
