class AddFieldsToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :description, :text
    add_column :tasks, :importance, :integer
    add_column :tasks, :accessibility, :integer
  end
end
