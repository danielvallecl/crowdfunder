class CreatePledges < ActiveRecord::Migration[5.0]
  def change
    create_table :pledges do |t|
      t.integer :amount
      t.integer :backer_id

      t.timestamps
    end
  end
end
