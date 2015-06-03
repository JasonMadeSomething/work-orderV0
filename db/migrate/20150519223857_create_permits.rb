class CreatePermits < ActiveRecord::Migration
  def change
    create_table :permits do |t|
      t.string :permitHolder
      t.belongs_to :client, index: true
      t.string :crid
      t.string :nonprofitAuthorizationNumber
      t.string :postOffice
      t.belongs_to :contact, index: true
      t.timestamps
    end
  end
end
