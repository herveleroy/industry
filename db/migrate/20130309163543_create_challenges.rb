class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :name
      t.text :description
      t.date :start_at
      t.date :end_at
      t.integer :owner_id
      t.string :state

      t.timestamps
    end
  end
end
