class AddDefaultProcessorIdToClients < ActiveRecord::Migration
  def change
    add_column :clients, :default_processor_id, :integer
  end
end
