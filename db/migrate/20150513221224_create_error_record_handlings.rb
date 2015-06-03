class CreateErrorRecordHandlings < ActiveRecord::Migration
  def change
    create_table :error_record_handlings do |t|
      t.string :name
      t.text :instruction

      t.timestamps
    end
  end
end
