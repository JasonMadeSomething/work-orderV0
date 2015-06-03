class CreatePresortInformations < ActiveRecord::Migration
  def change
    create_table :presort_informations do |t|
      t.integer :error_record_handling_id
      t.integer :deduping_instructions_id
      t.boolean :suppression
      t.timestamps
    end
  end
end
