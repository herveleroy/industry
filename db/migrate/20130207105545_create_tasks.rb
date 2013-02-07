class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :owner_id
      t.date :due_date
      t.boolean :completed
      t.references :taskable, :polymorphic => true

      t.timestamps
    end
  end
end
