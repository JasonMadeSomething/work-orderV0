class AddSortationAndLabelsFKsToPresortInformation < ActiveRecord::Migration
  def change
    add_column :presort_informations, :sortation_id, :integer
    add_index :presort_informations, :sortation_id
    add_column :presort_informations, :labels_id, :integer
    add_index :presort_informations, :labels_id
  end
end
