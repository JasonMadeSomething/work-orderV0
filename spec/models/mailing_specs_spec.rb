require 'rails_helper'

describe MailingSpecs do
   
    it { should validate_uniqueness_of(:sampleSize).scoped_to(:height, :width, :weightOfSample)}
    it { should validate_presence_of(:sampleSize)}
    it { should validate_presence_of(:width)}
    it { should validate_presence_of(:height)}
    it { should validate_presence_of(:weightOfSample)}
    
    it {should have_many(:presort_informations)}
    
    it "should allow height, width and weightOfSample to be decimals" do
        assert FactoryGirl.build(:letter_spec).valid?
    end
    
    it "should be totally unique" do
        FactoryGirl.create(:postcard_spec)
        b = FactoryGirl.build(:postcard_spec)
        expect{b.save}.to_not change{MailingSpecs.count}
    end
end
