class AddDeltaToKnowledge < ActiveRecord::Migration
  def change
    add_column :knowledges, :delta, :boolean,  :default => true, :null => false
  end
end
