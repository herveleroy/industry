class IdeaKnowledge < ActiveRecord::Migration
  def change
    create_table :ideas_knowledges do |t|
      t.integer :idea_id
      t.integer :knowledge_id

      t.timestamps
    end
    add_index "ideas_knowledges", "idea_id"
    add_index "ideas_knowledges", "knowledge_id"
  end
end
