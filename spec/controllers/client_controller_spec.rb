require 'rails_helper'

RSpec.describe ClientController, type: :controller do
    describe "client index pages" do

      context "GET #client_schedule" do
        before(:all){@wo = FactoryGirl.create(:base_work_order)}
        it "populates an array of all work orders for the passed client id" do
          5.times{FactoryGirl.create(:base_work_order)}
          get :client_schedule, client_id: @wo.client.id
          expect(assigns(:workorders)).to eq([@wo])
        end

        it "renders the :schedule template" do
          get :client_schedule, client_id: @wo.client.id
          expect(response).to render_template :schedule
        end
      end


      context "GET #client_archive" do
        before(:all){@wo = FactoryGirl.create(:work_order)}
        it "populates an array of all work orders for the passed client id" do
          5.times{FactoryGirl.create(:work_order)}
          get :client_archive, client_id: @wo.client.id
          expect(assigns(:workorders).count).to eq(@wo.client.work_orders.all.count)
        end

        it "renders the :archive template" do
          get :client_archive, client_id: @wo.client.id
          expect(response).to render_template :archive
        end
      end

    end
end
