class CorrectWorkorderAndPresortAssoscation < ActiveRecord::Migration
  def change
    remove_column :work_orders, :presort_informations_id
  end
end
