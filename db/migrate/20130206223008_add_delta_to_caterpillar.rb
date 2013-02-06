class AddDeltaToCaterpillar < ActiveRecord::Migration
  def change
    add_column :caterpillars, :delta, :boolean,  :default => true, :null => false
  end
end
