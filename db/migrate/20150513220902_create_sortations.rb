class CreateSortations < ActiveRecord::Migration
  def change
    create_table :sortations do |t|
      t.string :name

      t.timestamps
    end
  end
end
