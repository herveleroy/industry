class CreateKnowledges < ActiveRecord::Migration
  def change
    create_table :knowledges do |t|
      t.string :title
      t.text :description
      t.string :author

      t.timestamps
    end
  end
end
