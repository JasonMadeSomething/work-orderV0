class AddProcessorIdToWorkOrders < ActiveRecord::Migration
  def change
    add_column :work_orders, :processor_id, :integer
  end
end
