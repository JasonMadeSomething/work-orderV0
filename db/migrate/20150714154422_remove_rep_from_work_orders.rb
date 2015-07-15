class RemoveRepFromWorkOrders < ActiveRecord::Migration
  def change
    remove_column :work_orders, :rep
  end
end
