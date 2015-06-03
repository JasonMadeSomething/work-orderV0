class AddPhoneNumberToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :phoneNumber, :string
  end
end
