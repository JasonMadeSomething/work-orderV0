require 'rails_helper'

RSpec.describe ProductionDetailInsert, type: :model do
  it { should belong_to(:production_details) }
  it { should validate_presence_of(:production_details_id) }
  it { should belong_to(:insert) }
  it { should validate_presence_of(:insert_id) }
end
