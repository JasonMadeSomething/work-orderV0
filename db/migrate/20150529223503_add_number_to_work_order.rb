class AddNumberToWorkOrder < ActiveRecord::Migration
  def change
    add_column :work_orders, :number, :string
  end
end
