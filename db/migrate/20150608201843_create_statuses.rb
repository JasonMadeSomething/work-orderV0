class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :description
      t.timestamps
    end
    add_column :work_orders, :status_id, :integer
    add_index :work_orders, :status_id
  end
end
