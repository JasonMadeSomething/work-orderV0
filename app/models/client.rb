class Client < ActiveRecord::Base
  has_many :contacts
  has_many :addresses, through: :contacts
  has_many :permits
  has_many :work_orders
  validates :clientnumber, format: { with: /\A\d{3}\z/ },
                           length: { is: 3 }

  belongs_to :rep, class_name: 'User'
  belongs_to :default_processor, class_name: 'User'
end
