class Permit < ActiveRecord::Base
    belongs_to :client
    belongs_to :contact
    has_one :address, :through => :contact
    has_many :work_orders, :through => :presort_informations
    has_many :presort_informations
    validates_presence_of :permitHolder, :postOffice, :contact, :permit_number
end
