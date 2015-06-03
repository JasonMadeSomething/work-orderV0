class Contact < ActiveRecord::Base
    belongs_to :client
    belongs_to :address
    validates_presence_of :client, :name, :address
    validates_uniqueness_of :name, scope: [:client_id]
    
    before_save :check_for_existing_address
    
    
    
    protected
    
        def check_for_existing_address
            if self.address
                self.address = Address.find_or_create_by(address1: self.address.address1,
                                                         address2: self.address.address2,
                                                         city: self.address.city,
                                                         state: self.address.state)
            end
        end
end
