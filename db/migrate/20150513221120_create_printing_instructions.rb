class CreatePrintingInstructions < ActiveRecord::Migration
  def change
    create_table :printing_instructions do |t|

      t.timestamps
    end
  end
end
