class CreateWorkOrders < ActiveRecord::Migration
  def change
    create_table :work_orders do |t|
      t.references :client, index: true

      t.timestamps
    end
  end
end
