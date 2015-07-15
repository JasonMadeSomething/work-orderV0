require 'rails_helper'

describe Labels do
  it { should validate_presence_of(:name) }
  it { should have_many(:work_orders) }
end
