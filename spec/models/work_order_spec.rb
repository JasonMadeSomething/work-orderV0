require 'rails_helper'

RSpec.describe WorkOrder, type: :model do
  it {should belong_to(:client)}
  it {should belong_to(:project_type)}
  it {should have_one(:presort_information)}
  it {should have_one(:printing_instructions)}
  it {should have_one(:production_details)}
  it {should validate_presence_of(:number)}
  it {should validate_presence_of(:dueDate)}
  it {should validate_presence_of(:client_id)}
  it {should validate_presence_of(:project_type_id)}
  it {should allow_value('8801504-001', '8801612-999', '8881501-055', '7512005-010').for(:number)}
  it {should_not allow_value('321654764', '123-04-045', '12-01-587', '8801504-000', '8801513-001').for(:number)}
  it {should allow_value('001', '999', '010', '100', '505', '055').for(:monthlySequenceNumber)}
  
  
  describe "Number" do
    
    context "for the first Work Order of the month" do
      it 'should have a sequence number of "001"' do
        FactoryGirl.create(:base_work_order)
        Timecop.travel(1.month) do
          wo = FactoryGirl.build(:base_work_order)
          wo.save
          expect(wo.number[-3,3]).to eq("001")
        end
        Timecop.return
      end
    end
    
    context "is not the first Work order of the month" do
        it "should have a sequence number 1 greater than the most recently created record" do
          placeholder = FactoryGirl.create(:base_work_order)
          wo = FactoryGirl.create(:base_work_order)
          expect(wo.number[-3,3].to_i).to eq(placeholder.number[-3,3].to_i + 1) 
        end
      end
      
    describe "auto-formatting" do
      wo = FactoryGirl.create(:base_work_order)
      
      it "should use monthly sequence number as last 3 digits" do
        expect(wo.number[-3,3]).to eq("%03d" % (WorkOrder.where(:created_at => Time.now.beginning_of_month..Time.now.end_of_month).count + 1))
      end
      
      it "should use client number as first 3 digits" do
        expect(wo.number[0..2]).to eq(wo.client.clientnumber)
      end
        
      it "should use current date to set middle 4 digits" do
        expect(wo.number[3,4]).to eq("#{Date.today.year.to_s[-2,2]}#{"%02d" % Date.today.month.to_s}")
      end
      
    end
  end
  
  describe "Project Type" do
  
    context "is Other" do
      wo = FactoryGirl.build(:other_project_work_order)
      it "should not require presort information" do
        expect(wo).to_not validate_presence_of(:presort_information)
      end
      it "should not requre printing instructions" do
        expect(wo).to_not validate_presence_of(:printing_instructions)
      end
    end
  
    context "is printing and mailing" do
      wo = FactoryGirl.build(:print_and_mail_work_order)
        it "should require presort information" do
          expect(wo).to validate_presence_of(:presort_information)
        end
        
        it "should require printing instructions" do
          expect(wo).to validate_presence_of(:printing_instructions)
        end
    end
    
    context "mailing does not require digital printing" do
        wo = FactoryGirl.build(:mailing_work_order)
        it "should not require digital printing instructions" do
          expect(wo).to_not validate_presence_of(:printing_instructions)
        end
        
        it "should require presort information" do
          expect(wo).to validate_presence_of(:presort_information)
        end
    end
  
    context "is digital print only" do
      wo = FactoryGirl.build(:digital_print_work_order)
      
      it "should require printing instructions" do
        expect(wo).to validate_presence_of(:printing_instructions)
      end
      
      it "should not require presort information" do
        expect(wo).to_not validate_presence_of(:presort_information)
      end
      
    end
  end
end