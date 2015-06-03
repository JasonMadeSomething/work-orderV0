class AddWorkOrderIdToPrintingInstructions < ActiveRecord::Migration
  def change
    add_column :printing_instructions, :work_order_id, :integer
    add_index :printing_instructions, :work_order_id
  end
end
