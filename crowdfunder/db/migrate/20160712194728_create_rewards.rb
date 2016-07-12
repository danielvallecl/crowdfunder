class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.text :description

      t.belongs_to :project, foreign_key: true

      t.timestamps null: false
    end
  end
end
