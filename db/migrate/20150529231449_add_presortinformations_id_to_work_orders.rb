class AddPresortinformationsIdToWorkOrders < ActiveRecord::Migration
  def change
    add_column :work_orders, :presort_informations_id, :integer
    remove_column :presort_informations, :work_order_id
  end
end
