class AddMailedDateToWorkOrder < ActiveRecord::Migration
  def change
    add_column :work_orders, :mailedDate, :date
  end
end
