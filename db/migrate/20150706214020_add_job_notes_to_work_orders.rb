class AddJobNotesToWorkOrders < ActiveRecord::Migration
  def change
    add_column :work_orders, :jobNotes, :text
  end
end
