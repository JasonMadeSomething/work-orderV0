class AddNameToPieceTypes < ActiveRecord::Migration
  def change
    add_column :piece_types, :name, :string
  end
end
