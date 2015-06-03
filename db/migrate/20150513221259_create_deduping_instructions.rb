class CreateDedupingInstructions < ActiveRecord::Migration
  def change
    create_table :deduping_instructions do |t|
      t.string :name
      t.text :instruction

      t.timestamps
    end
  end
end
