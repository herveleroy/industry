class AddTaxonToTag < ActiveRecord::Migration
  def change
    add_column :tags, :taxon, :boolean, :default => false
  end
end
