class CreateChrysalisKnowledges < ActiveRecord::Migration
   def change
    create_table :chrysalis_knowledges do |t|
      t.integer :chrysali_id
      t.integer :knowledge_id

      t.timestamps
    end
    add_index "chrysalis_knowledges", "chrysali_id"
    add_index "chrysalis_knowledges", "knowledge_id"
  end
end
