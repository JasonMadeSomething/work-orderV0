class User < ActiveRecord::Base
    has_secure_password
    
    validates_uniqueness_of :email
    validates_presence_of :email
    validates_presence_of :name
    belongs_to :role
    has_many :clients, foreign_key: 'rep_id'
    has_many :processing_tasks, class_name: 'WorkOrder', foreign_key: 'processor_id'
    
    def has_role?(role_sym)
        role.name.underscore.to_sym == role_sym 
    end
    
    def submitted_jobs
        if self.has_role?(:rep)
            WorkOrder.joins(:client).where('clients.rep_id = ?', self.id)
        end
    end
            
end
