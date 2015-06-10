class AddProjectDescriptionToWorkOrders < ActiveRecord::Migration
  def change
    add_column :work_orders, :projectDescription, :text
  end
end
