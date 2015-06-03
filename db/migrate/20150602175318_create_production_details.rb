class CreateProductionDetails < ActiveRecord::Migration
  def change
    create_table :production_details do |t|
      t.references :WorkOrder, index: true
      t.timestamps
    end
  end
end
