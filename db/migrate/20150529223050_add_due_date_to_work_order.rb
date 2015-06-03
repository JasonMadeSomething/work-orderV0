class AddDueDateToWorkOrder < ActiveRecord::Migration
  def change
    add_column :work_orders, :dueDate, :date
  end
end
