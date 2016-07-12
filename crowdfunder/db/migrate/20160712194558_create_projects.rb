class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.integer :goal
      t.datetime :deadline

      t.belongs_to :user, foreign_key: true

      t.timestamps null: false
    end
  end
end
