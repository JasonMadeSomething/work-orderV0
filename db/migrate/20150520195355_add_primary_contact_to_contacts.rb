class AddPrimaryContactToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :primaryContact, :boolean
  end
end
