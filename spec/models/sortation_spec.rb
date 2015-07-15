require 'rails_helper'

describe Sortation do
  it { should validate_presence_of(:name) }
  it { should have_many(:presort_informations) }
end
