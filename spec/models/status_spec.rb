require 'rails_helper'

RSpec.describe Status, type: :model do
  it {should validate_presence_of(:description)}
  it {should have_many(:work_orders)}
  it {should validate_inclusion_of(:description).in_array(["Active", "Completed", "On Hold"])}
  it {should validate_uniqueness_of(:description)}
end
