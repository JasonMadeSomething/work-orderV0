class AddRemovalsToPresortInformation < ActiveRecord::Migration
  def change
    add_column :presort_informations, :errors_removed, :integer
    add_column :presort_informations, :duplicates_removed, :integer
  end
end
