class AddDescriptionToInserts < ActiveRecord::Migration
  def change
    add_column :inserts, :description, :text
  end
end
