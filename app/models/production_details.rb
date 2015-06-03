class ProductionDetails < ActiveRecord::Base
  belongs_to :work_order
  has_many :production_detail_tabs
  has_many :tabs, :through => :production_detail_tabs
  validates_presence_of :work_order_id
end
