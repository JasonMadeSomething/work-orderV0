class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.belongs_to :client, index: true
      t.belongs_to :address, index: true
      t.timestamps
    end

  end
end
