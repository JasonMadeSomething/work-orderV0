class AddNameToPostageTypes < ActiveRecord::Migration
  def change
    add_column :postage_types, :name, :string
  end
end
