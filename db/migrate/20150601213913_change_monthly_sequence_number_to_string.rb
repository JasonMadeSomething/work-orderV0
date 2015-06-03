class ChangeMonthlySequenceNumberToString < ActiveRecord::Migration
  def change
    change_column :work_orders, :monthlySequenceNumber, :string
  end
end
