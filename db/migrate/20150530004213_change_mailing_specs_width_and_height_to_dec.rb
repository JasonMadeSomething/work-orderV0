class ChangeMailingSpecsWidthAndHeightToDec < ActiveRecord::Migration
  def change
    change_column :mailing_specs, :width, :decimal
    change_column :mailing_specs, :height, :decimal
  end
end
