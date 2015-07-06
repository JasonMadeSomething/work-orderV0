class ChangeWorkorderDescriptionToTitle < ActiveRecord::Migration
  def change
    rename_column :work_orders, :projectDescription, :title
    change_column :work_orders, :title, :string
    add_column :work_orders, :projectDescription, :text
  end
end
