class CreateSprints < ActiveRecord::Migration
  def change
    create_table :sprints do |t|
      t.date :start
      t.date :end
      t.belongs_to :project, index: true
      t.boolean :status

      t.timestamps null: false
    end

    add_foreign_key :sprints, :projects, on_delete: :cascade
  end
end
