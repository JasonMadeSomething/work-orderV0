require 'rails_helper'

describe DedupingInstructions do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:instruction) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_uniqueness_of(:instruction) }
  it { should have_many(:presort_informations) }
end
