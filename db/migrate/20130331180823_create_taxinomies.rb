class CreateTaxinomies < ActiveRecord::Migration
  def change
    create_table :taxinomies do |t|
      t.string :dimension
      t.integer :tag_id
      t.integer :position
      t.integer :weight

      t.timestamps
    end
  end
end
