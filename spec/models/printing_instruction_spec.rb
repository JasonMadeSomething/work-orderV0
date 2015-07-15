require 'rails_helper'

describe PrintingInstructions do
  it { should belong_to(:work_order) }

  it { should validate_presence_of(:paperStock) }
  it { should validate_presence_of(:nUp) }

  it { should allow_value(true).for(:color) }
  it { should allow_value(false).for(:color) }
  it { should_not allow_value(nil).for(:color) }

  it { should allow_value(true).for(:duplex) }
  it { should allow_value(false).for(:duplex) }
  it { should_not allow_value(nil).for(:duplex) }

  it { should allow_value(true).for(:variableData) }
  it { should allow_value(false).for(:variableData) }
  it { should_not allow_value(nil).for(:variableData) }
end
