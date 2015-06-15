class AddLabelIdToWorkOrders < ActiveRecord::Migration
  def change
    add_column :work_orders, :labels_id, :integer
  end
end
