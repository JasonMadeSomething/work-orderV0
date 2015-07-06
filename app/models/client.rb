class Client < ActiveRecord::Base
  has_many :contacts
  has_many :addresses, through: :contacts
  has_many :permits
  validates :clientnumber, format: { with: /\A\d{3}\z/ },
                                     length: { is: 3 }
  has_many :work_orders
end
