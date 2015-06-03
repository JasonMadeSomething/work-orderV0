class AddWorkOrderIdToProductionDetails < ActiveRecord::Migration
  def change
    add_column :production_details, :work_order_id, :integer
  end
end
