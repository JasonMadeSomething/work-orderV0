class AddProjectTypeIndexToWorkOrders < ActiveRecord::Migration
  def change
    add_index :work_orders, :project_type_id
  end
end
