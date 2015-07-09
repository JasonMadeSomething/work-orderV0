# Controller for central object in system
# Most things will go through here
class WorkOrdersController < ApplicationController
  before_action :set_workorder, only: [:show, :destroy, :edit, :update]

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
      redirect_to root_path, alert: 'No Client Exists with that number'
    end
  end

  def create
    @workorder = WorkOrder.new(workorder_params)
    @workorder.status = Status.find_by(description: 'Active')
    respond_to do |format|
      if @workorder.save
        format.html do
          redirect_to @workorder,
                      notice: 'Work Order was successfully created.'
        end
        format.json { render :show, status: :created, location: @workorder }
      else
        format.html { render :new }
        format.json do
          render json: @workorder.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end
  
  def update
    respond_to do |format|
      if @workorder.update_attributes(workorder_params)
        format.html { redirect_to(@workorder, notice: 'Successfully edited work order.') }
        format.json { respond_with_bip(@workorder) }
      else
        format.html { render :action => "edit"}
        format.json { respond_with_bip(@workorder) }
      end
    end
  end
  
  def show
  end

  def edit
  end

  def destroy
    @workorder.status.description = 'Deleted'
    respond_to do |format|
      format.js { @workorder.status.description = 'Deleted' }
    end
  end

  private

  def set_workorder
    @workorder = WorkOrder.find(params[:id])
  end

  def workorder_params
    params.require(:work_order).permit!
  end
end
