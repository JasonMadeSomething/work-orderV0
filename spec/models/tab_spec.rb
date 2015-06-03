require 'rails_helper'

RSpec.describe Tab, type: :model do
  it {should have_many(:production_detail_tabs)}
  
end
