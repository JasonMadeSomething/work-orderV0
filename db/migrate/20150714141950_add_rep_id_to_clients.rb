class AddRepIdToClients < ActiveRecord::Migration
  def change
    add_column :clients, :rep_id, :integer
  end
end
