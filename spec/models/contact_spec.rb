require 'rails_helper'

describe Contact do
  it { should belong_to(:address) }
  it { should belong_to(:client) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:address) }
  it { should validate_uniqueness_of(:name).scoped_to(:client_id) }

  describe 'address creation' do
    let!(:test_address) { FactoryGirl.create(:address) }
    let!(:test_client) { FactoryGirl.create(:client) }
    let!(:test_contact) { Contact.new(name: 'xyz', client: test_client) }

    context 'when address exists' do
      it 'should use the existing address' do
        duplicate_address = FactoryGirl.build(:address)
        test_contact.address = duplicate_address
        test_contact.save
        expect(test_contact.address).to eq(test_address)
      end
    end
    context 'when a new address' do
      it 'should use the new address' do
        new_address = FactoryGirl.build(:address_seq)
        test_contact.address = new_address
        test_contact.save
        expect(test_contact.address.id).not_to be_nil
      end
    end
  end
end
