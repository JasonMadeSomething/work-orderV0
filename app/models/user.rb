class User < ActiveRecord::Base
    has_secure_password
    
    validates_uniqueness_of :email
    validates_presence_of :email
    validates_presence_of :name
    belongs_to :role
    
    def has_role?(role_sym)
        roles.any? { |r| r.name.underscore.to_sym == role_sym }
    end
end
