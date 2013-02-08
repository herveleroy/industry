class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.references :attachable, :polymorphic => true

      t.timestamps
    end
  end
end
