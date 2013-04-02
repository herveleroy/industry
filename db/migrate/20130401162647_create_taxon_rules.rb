class CreateTaxonRules < ActiveRecord::Migration
  def change
    create_table :taxon_rules do |t|
      t.text :tags
      t.string :taxon

      t.timestamps
    end
  end
end
