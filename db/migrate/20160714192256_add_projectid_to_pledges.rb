class AddProjectidToPledges < ActiveRecord::Migration[5.0]
  def change
    add_column :pledges, :project_id, :integer
  end
end
