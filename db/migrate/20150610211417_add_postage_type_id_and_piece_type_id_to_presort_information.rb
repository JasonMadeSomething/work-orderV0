class AddPostageTypeIdAndPieceTypeIdToPresortInformation < ActiveRecord::Migration
  def change
    add_column :presort_informations, :postage_type_id, :integer
    add_column :presort_informations, :piece_type_id, :integer
  end
end
