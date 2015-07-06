class WorkOrdersController < ApplicationController
  before_action :set_workorder, only: [:show, :destroy, :edit]

  
  def index
    redirect_to schedule_path
  end
  
  def schedule
    @workorders = WorkOrder.schedule
  end
  
  def archive
    @workorders = WorkOrder.order(:created_at).reverse_order
  end
  
  def new
    client = Client.find_by(clientnumber: params[:client_number])
    if client
      @workorder = WorkOrder.new(client: client)
      @workorder.set_workorder_number
    else
      redirect_to root_path, alert: "No Client Exists with that number"
    end
  end
  
  def create
    
    @workorder = WorkOrder.new(workorder_params)
    @workorder.status = Status.find_by(description: "Active")
    respond_to do |format|
      if @workorder.save
        format.html { redirect_to @workorder, notice: 'Work Order was successfully created.' }
        format.json { render :show, status: :created, location: @workorder }
      else
        format.html { render :new }
        format.json { render json: @workorder.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def destroy
    @workorder.status.description = "Deleted"
  end
  
  private
  
    def set_workorder
      @workorder = WorkOrder.find(params[:id])
    end
    
    def workorder_params
      params.require(:work_order).permit!
    end
end
