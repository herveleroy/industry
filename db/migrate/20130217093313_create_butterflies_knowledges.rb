class CreateButterfliesKnowledges < ActiveRecord::Migration
  def change
    create_table :butterflies_knowledges do |t|
      t.integer :butterfly_id
      t.integer :knowledge_id

      t.timestamps
    end
  end
end
