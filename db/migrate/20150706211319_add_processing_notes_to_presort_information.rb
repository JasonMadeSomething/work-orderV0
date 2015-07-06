class AddProcessingNotesToPresortInformation < ActiveRecord::Migration
  def change
    add_column :presort_informations, :processing_notes, :text
  end
end
