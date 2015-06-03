class RemovePersortInformationIdFromWorkOrders < ActiveRecord::Migration
  def change
    remove_column :work_orders, :presort_information_id
    add_column :presort_informations, :work_order_id, :integer
    add_index :presort_informations, :work_order_id
  end
end
