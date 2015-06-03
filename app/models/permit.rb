class Permit < ActiveRecord::Base
    belongs_to :client
    belongs_to :contact
    has_one :address, :through => :contact
    validates_presence_of :permitHolder, :postOffice, :contact, :permit_number
end
