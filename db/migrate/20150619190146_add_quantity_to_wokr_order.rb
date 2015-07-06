class AddQuantityToWokrOrder < ActiveRecord::Migration
  def change
    add_column :work_orders, :quantity, :integer
  end
end
