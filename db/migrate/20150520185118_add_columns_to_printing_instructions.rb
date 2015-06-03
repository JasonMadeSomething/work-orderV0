class AddColumnsToPrintingInstructions < ActiveRecord::Migration
  def change
    add_column :printing_instructions, :paperStock, :string
    add_column :printing_instructions, :color, :boolean
    add_column :printing_instructions, :duplex, :boolean
    add_column :printing_instructions, :nUp, :integer
    add_column :printing_instructions, :variableData, :boolean
  end
end
