class AddMonthlySequenceNumberToWorkOrders < ActiveRecord::Migration
  def change
    add_column :work_orders, :monthlySequenceNumber, :integer
  end
end
