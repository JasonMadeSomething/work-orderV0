class AddWorkOrderIdToPresortInformations < ActiveRecord::Migration
  def change
    add_column :presort_informations, :work_order_id, :integer
  end
end
