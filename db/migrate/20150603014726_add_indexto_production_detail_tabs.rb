class AddIndextoProductionDetailTabs < ActiveRecord::Migration
  def change
    add_index :production_detail_tabs, :production_details_id
    add_index :production_detail_tabs, :tab_id
  end
end
