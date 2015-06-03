class CreateMailingSpecs < ActiveRecord::Migration
  def change
    create_table :mailing_specs do |t|
      t.integer :height
      t.integer :width
      t.integer :sampleSize
      t.decimal :weightOfSample

      t.timestamps
    end
  end
end
