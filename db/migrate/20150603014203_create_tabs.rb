class CreateTabs < ActiveRecord::Migration
  def change
    create_table :tabs do |t|
      t.string :location
      t.string :type

      t.timestamps
    end
  end
end
