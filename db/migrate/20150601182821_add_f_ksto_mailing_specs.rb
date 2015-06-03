class AddFKstoMailingSpecs < ActiveRecord::Migration
  def change
    add_column :presort_informations, :permit_id, :integer
    add_index :presort_informations, :permit_id
    add_column :presort_informations, :mailing_specs_id, :integer
    add_index :presort_informations, :mailing_specs_id
    add_column :presort_informations, :mail_class_id, :integer
    add_index :presort_informations, :mail_class_id
    add_index :presort_informations, :error_record_handling_id
    add_index :presort_informations, :deduping_instructions_id
  end
end
