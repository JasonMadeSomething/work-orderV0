require 'rails_helper'

RSpec.describe ProductionDetails, type: :model do
  it {should belong_to(:work_order)}
  it {should validate_presence_of(:work_order_id)}
  it {should have_many(:tabs)}
  it {should have_many(:production_detail_tabs)}
  it {should have_many(:inserts)}
  it {should have_many(:production_detail_inserts)}
end
