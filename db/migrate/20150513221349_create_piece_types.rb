class CreatePieceTypes < ActiveRecord::Migration
  def change
    create_table :piece_types do |t|
      t.name
      
      t.timestamps
    end
  end
end
