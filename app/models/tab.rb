class Tab < ActiveRecord::Base
    has_many :production_detail_tabs
    validates_presence_of :location, :type
    validates_uniqueness_of :location, scope: :type
end
