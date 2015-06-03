class AddProjectTypeIdToWorkOrder < ActiveRecord::Migration
  def change
    add_column :work_orders, :project_type_id, :integer
  end
end
