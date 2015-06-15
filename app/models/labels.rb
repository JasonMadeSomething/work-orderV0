class Labels < ActiveRecord::Base
    validates_presence_of :name
    has_many :work_orders
end
