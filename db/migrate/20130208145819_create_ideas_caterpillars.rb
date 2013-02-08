class CreateIdeasCaterpillars < ActiveRecord::Migration
  def change
    create_table :ideas_caterpillars do |t|
      t.integer :idea_id
      t.integer :caterpillar_id

      t.timestamps
    end
    add_index "ideas_caterpillars", "idea_id"
    add_index "ideas_caterpillars", "caterpillar_id"
  end
end
