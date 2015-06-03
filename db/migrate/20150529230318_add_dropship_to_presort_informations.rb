class AddDropshipToPresortInformations < ActiveRecord::Migration
  def change
    add_column :presort_informations, :dropship, :boolean
    add_column :presort_informations, :dropshipLocation, :string
  end
end
