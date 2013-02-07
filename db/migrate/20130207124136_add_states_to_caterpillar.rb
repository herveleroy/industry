class AddStatesToCaterpillar < ActiveRecord::Migration
  def change
    add_column :caterpillars, :state, :string
  end
end
