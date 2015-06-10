class WorkOrderController < ApplicationController
  before_action :set_workorder, only: [:show]
  before_action :set_workorders_schedule, only: [:schedule, :client_schedule]
  before_action :set_workorders_archive, only: [:archive, :client_archive]
  
  
  def schedule
  end
  
  def archive
  end
  
  def show
  end
  
  def client_schedule
    render 'schedule'
  end
  
  def client_archive
    render 'archive'
  end
  
  private
  
    def set_workorder
      @workorder = WorkOrder.find(params[:id])
    end
    
    def set_workorders_schedule
      if params[:client_id]
        @workorders = WorkOrder.where(client_id: params[:client_id])
      else
        @workorders = WorkOrder.schedule
      end
    end
    
    def set_workorders_archive
      if params[:client_id]
        @workorders = WorkOrder.where(client_id: params[:client_id]).order(:created_at).reverse_order
      else
        @workorders = WorkOrder.order(:created_at).reverse_order
      end
    end
    
end
