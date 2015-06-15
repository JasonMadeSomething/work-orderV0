require 'rails_helper'

describe Permit, type: :model do
  it {should belong_to(:client)}
  it {should belong_to(:contact)}
  #has an address through the contact
  it {should have_one(:address)}
  it {should have_many(:presort_informations)}
  it {should validate_presence_of(:permitHolder)}
  it {should validate_presence_of(:postOffice)}
  it {should validate_presence_of(:contact)}
  it {should validate_presence_of(:permit_number)}
  
end
