class ClientController < ApplicationController
    
    def index
       @client = Client.all 
    end
    
    def schedule
        @workorders = WorkOrder.schedule.where(client_id: params[:client_id])
        render 'work_order/schedule'
    end
    
    def archive
        @workorders = WorkOrder.where(client_id: params[:client_id]).order(:created_at).reverse_order
        render 'work_order/archive'
    end
    
end
