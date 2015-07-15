require 'rails_helper'

RSpec.describe PresortInformation, type: :model do
  it { should belong_to(:error_record_handling) }
  it { should belong_to(:deduping_instructions) }
  it { should belong_to(:work_order) }
  it { should belong_to(:mail_class) }
  it { should belong_to(:permit) }
  it { should belong_to(:mailing_specs) }
  it { should belong_to(:sortation) }
  it { should belong_to(:labels) }

  it { should allow_value(true).for(:suppression) }
  it { should allow_value(false).for(:suppression) }
  it { should_not allow_value(nil).for(:suppression) }

  it { should allow_value(true).for(:dropship) }
  it { should allow_value(false).for(:dropship) }
  it { should_not allow_value(nil).for(:dropship) }
end
