class PostageType < ActiveRecord::Base
    validates :name, presence: true,
                     uniqueness: true
    has_many :presort_informations
end
