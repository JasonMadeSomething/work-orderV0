# Controller for clients. Need only bare minimum given
# I don't plan to do anything complicated with clients for now
class ClientController < ApplicationController
  def index
    @client = Client.all
  end

  def schedule
    @workorders = WorkOrder.schedule.where(client_id: params[:client_id])
    render 'work_orders/schedule'
  end

  def archive
    @workorders = WorkOrder.where(client_id: params[:client_id]).order(:created_at).reverse_order
    render 'work_orders/archive'
  end
  
  def new
    @client = Client.new()
  end
  
end
