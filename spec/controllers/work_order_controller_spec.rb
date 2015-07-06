require 'rails_helper'

RSpec.describe WorkOrderController, type: :controller do

    describe "GET #schedule" do
      before(:all) do
        5.times{ FactoryGirl.create(:base_work_order)}
        FactoryGirl.create(:completed_work_order)
        FactoryGirl.create(:held_work_order)
      end

      it "returns http success" do
        get :schedule
        expect(response).to have_http_status(:success)
      end
      it "populates an array of active work orders ordered by due date" do
        get :schedule
        expect(assigns(:workorders)).to eq(WorkOrder.schedule), "@workorders does not equal WorkOrder.schedule"
      end

      it "renders the :schedule template" do
        get :schedule
        expect(response).to render_template :schedule
      end
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
end
