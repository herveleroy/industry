class CreateCaterpillarsKnowledges < ActiveRecord::Migration
  def change
    create_table :caterpillars_knowledges do |t|
      t.integer :caterpillar_id
      t.integer :knowledge_id

      t.timestamps
    end
    add_index "caterpillars_knowledges", "caterpillar_id"
    add_index "caterpillars_knowledges", "knowledge_id"
  end
end
