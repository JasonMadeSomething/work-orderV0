require 'rails_helper'

RSpec.describe WorkOrderController, type: :controller do

    describe "GET #schedule" do
      
      it "returns http success" do
        get :schedule
        expect(response).to have_http_status(:success)
      end
      it "populates an array of active work orders ordered by due date" do
        get :schedule
        expect(assigns(:workorders)).to eq(WorkOrder.schedule)
      end
      
      it "renders the :schedule template"
    end
  
    describe "GET #archive" do
      it "returns http success" do
        get :archive
        expect(response).to have_http_status(:success)
      end
      it "populates an array of all work orders in reverse order" do
        get :archive
        expect(assigns(:workorders)).to eq(WorkOrder.order(:created_at).reverse_order)
      end
      
      it "renders the :archive template" do
        get :archive
        expect(response).to render_template :archive
      end
    end
    
    describe "GET #show" do
      it "assigns the requested work order to @workorder" do
        wo = FactoryGirl.create(:base_work_order)
        get :show, id: wo
        expect(assigns(:workorder)).to eq(wo) 
      end
      
      it "renders the :show template" do
        get :show, id: FactoryGirl.create(:base_work_order)
        expect(response).to render_template :show
      end
      
    end
    
    describe "client index pages" do
      

      
      context "GET #client_schedule" do
        it "populates an array of all work orders for the passed client id" do
          wo = FactoryGirl.create(:base_work_order)
          5.times{FactoryGirl.create(:base_work_order)}
          get :client_schedule, client_id: wo.client.id
          expect(assigns(:workorders)).to eq([wo])
        end
      end
      
      
      context "GET #client_archive" do
        it "populates an array of all work orders for the passed client id" do
          wo = FactoryGirl.create(:work_order)
          5.times{FactoryGirl.create(:work_order)}
          get :client_archive, client_id: wo.client.id
          expect(assigns(:workorders).count).to eq(6)
        end
        
      end
      
    end
    
end
