class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.integer :amount

      t.belongs_to :project, foreign_key: true

      t.timestamps null: false
    end
  end
end
