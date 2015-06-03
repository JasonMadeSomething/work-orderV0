require 'rails_helper'

describe ErrorRecordHandling do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:instruction)}
    it {should validate_uniqueness_of(:name)}
    it {should validate_uniqueness_of(:instruction)}
end