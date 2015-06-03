require 'rails_helper'

RSpec.describe ProjectType, type: :model do
  it {should have_many(:work_orders)}
end
