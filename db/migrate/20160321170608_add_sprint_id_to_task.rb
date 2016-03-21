class AddSprintIdToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :sprint_id, :integer
    add_foreign_key :tasks, :sprints, on_delete: :cascade
    add_index :tasks, :sprint_id
  end
end
