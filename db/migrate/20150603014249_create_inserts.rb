class CreateInserts < ActiveRecord::Migration
  def change
    create_table :inserts do |t|
      t.boolean :hand
      t.boolean :machine

      t.timestamps
    end
  end
end
