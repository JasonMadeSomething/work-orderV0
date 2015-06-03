class Workorderquickfix < ActiveRecord::Migration
  def change
    remove_column :work_orders, :presort_informations_id
    add_column :work_orders, :presort_information_id, :integer
  end
end
