require 'rails_helper'

RSpec.describe Tab, type: :model do
  it {should have_many(:production_detail_tabs)}
  it {should validate_presence_of(:location)}
  it {should validate_presence_of(:type)}
  it {should validate_uniqueness_of(:location).scoped_to(:type)}
  
end
