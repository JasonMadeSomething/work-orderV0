class Address < ActiveRecord::Base
    validates_presence_of :address1, :city, :state, :zip
    validates_uniqueness_of :address1, scope: [:address2, :city, :state]
end
