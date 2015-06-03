class AddPermitNumbertoPermits < ActiveRecord::Migration
  def change
    add_column :permits, :permit_number, :string
  end
end
