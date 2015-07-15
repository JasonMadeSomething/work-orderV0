require 'rails_helper'

RSpec.describe Insert, type: :model do
  it { should allow_value(true).for(:hand) }
  it { should allow_value(false).for(:hand) }
  it { should_not allow_value(nil).for(:hand) }

  it { should allow_value(true).for(:machine) }
  it { should allow_value(false).for(:machine) }
  it { should_not allow_value(nil).for(:machine) }

  it { should validate_presence_of(:description) }

  it { should have_many(:production_detail_inserts) }
end
