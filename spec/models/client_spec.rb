require 'rails_helper'

describe Client do
  it { should have_many(:contacts) }
  it { should have_many(:addresses) }
  it { should have_many(:permits) }
  it { should have_many(:work_orders) }
  it { should belong_to(:rep) }
  it { should belong_to(:default_processor) }
  it do
    should allow_value('880', '546', '001', '999').for(:clientnumber)
  end
  it do
    should_not allow_value('foo', '8ar', '1',  2 ).for(:clientnumber)
  end
  it { should validate_length_of(:clientnumber).is_equal_to(3) }
end
