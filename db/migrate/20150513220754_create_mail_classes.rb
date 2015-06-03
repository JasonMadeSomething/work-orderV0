class CreateMailClasses < ActiveRecord::Migration
  def change
    create_table :mail_classes do |t|
      t.string :name

      t.timestamps
    end
  end
end
