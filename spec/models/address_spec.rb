require 'rails_helper'

describe Address do

    it {should validate_presence_of(:address1)}
    it {should validate_presence_of(:city)}
    it {should validate_presence_of(:state)}
    it {should validate_presence_of(:zip)}
    it {should validate_uniqueness_of(:address1).scoped_to(:address2, :city, :state)}
    
        
end
