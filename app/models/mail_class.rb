class MailClass < ActiveRecord::Base
    validates_presence_of(:name)
    has_many(:presort_informations)
end
