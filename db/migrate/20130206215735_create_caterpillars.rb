class CreateCaterpillars < ActiveRecord::Migration
  def change
    create_table :caterpillars do |t|
      t.string :title
      t.integer :author_id
      t.text :description
      t.text :application

      t.timestamps
    end
  end
end
