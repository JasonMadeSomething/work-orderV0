class AddMailingAndPrintingToProjectType < ActiveRecord::Migration
  def change
    add_column :project_types, :mailing, :boolean
    add_column :project_types, :printing, :boolean
  end
end
