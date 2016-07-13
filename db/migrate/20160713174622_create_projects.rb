class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.integer :goal
      t.datetime :start_date
      t.datetime :deadline
      t.integer :owner_id
      t.integer :category_id
      t.string :url

      t.timestamps
    end
  end
end
