require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:name) }
  it { should belong_to(:role) }
  it { should have_many(:processing_tasks) }

  admin_user = FactoryGirl.create(:user_admin)
  processor_user = FactoryGirl.create(:user_processor)
  manager_user = FactoryGirl.create(:user_manager)
  rep_user = FactoryGirl.create(:user_rep)
  accountant_user = FactoryGirl.create(:user_accountant)

  describe '#submitted_jobs' do
    context 'user is not a rep' do
      it 'should return nil'

    end
    context 'user is a rep' do
      it 'should return all work orders created by that rep'

      it 'should not return deleted work orders'

      it 'should order work orders by creation date'

    end
  end

  describe '#processing_tasks' do
    context 'user is not a processor' do
      it 'should return nil'
    end
    context 'user is a processor' do
      it 'should return all work orders assigned to the processor'

      it 'should order work orders by due date'

    end
  end
  describe '#has_role?' do

    context ':admin' do
      it 'should return true if user has role admin' do
        expect(admin_user).to have_role(:admin)
      end
      it 'should return false if user has other role' do
        [processor_user, manager_user, rep_user, accountant_user].each do |usr|
          expect(usr).not_to have_role(:admin)
        end
      end
    end
    context ':processor' do
      it 'should return true if user has role :processor' do
        expect(processor_user).to have_role(:processor)
      end
      it 'should return false if user has other role' do
        [admin_user, manager_user, rep_user, accountant_user].each do |usr|
          expect(usr).not_to have_role(:processor)
        end
      end
    end
    context ':rep' do
      it 'should return true if user has role rep' do
        expect(rep_user).to have_role(:rep)
      end
      it 'should return false if user has other role' do
        [admin_user, manager_user, processor_user, accountant_user].each do |usr|
          expect(usr).not_to have_role(:rep)
        end
      end
    end
    context ':accountant' do
      it 'should return true if user has role accountant' do
        expect(accountant_user).to have_role(:accountant)
      end
      it 'should return false if use has other role' do
        [admin_user, manager_user, processor_user, rep_user].each do |usr|
          expect(usr).not_to have_role(:accountant)
        end
      end
    end
    context ':manager' do
      it 'should return true if user has role manager' do
        expect(manager_user).to have_role(:manager)
      end
      it 'should return false if use has other role' do
        [admin_user, accountant_user, processor_user, rep_user].each do |usr|
          expect(usr).not_to have_role(:manager)
        end
      end
    end
  end
end
