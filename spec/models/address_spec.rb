require 'rails_helper'

describe Address do

    it {should validate_presence_of(:address1)}
    it {should validate_presence_of(:city)}
    it {should validate_presence_of(:state)}
    it {should validate_presence_of(:zip)}
    it {should validate_uniqueness_of(:address1).scoped_to(:address2, :city, :state)}
    
    
    describe "ensures uniquness" do
        context "when address already exists" do
            it "should find the existing address and set self to it"
        end
        context "when address does not exist" do
            it "should create the new address"
        end
        
        
end
