class CreateProductionDetailTabs < ActiveRecord::Migration
  def change
    create_table :production_detail_tabs do |t|
      t.string :production_details_id
      t.string :tab_id

      t.timestamps
    end
  end
end
