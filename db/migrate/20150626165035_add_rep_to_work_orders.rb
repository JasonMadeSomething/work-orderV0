class AddRepToWorkOrders < ActiveRecord::Migration
  def change
    add_column :work_orders, :rep, :string
  end
end
