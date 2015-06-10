class CreateProductionDetailInserts < ActiveRecord::Migration
  def change
    create_table :production_detail_inserts do |t|
      t.integer :insert_id
      t.integer :production_details_id

      t.timestamps
    end
    add_index :production_detail_inserts, :insert_id
    add_index :production_detail_inserts, :production_details_id
  end
end
