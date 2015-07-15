require 'rails_helper'

RSpec.describe ProductionDetailTab, type: :model do
  it { should belong_to(:production_details) }
  it { should validate_presence_of(:production_details_id) }
  it { should belong_to(:tab) }
  it { should validate_presence_of(:tab_id) }
end
