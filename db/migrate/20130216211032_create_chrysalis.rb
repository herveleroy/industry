class CreateChrysalis < ActiveRecord::Migration
  def change
    create_table :chrysalis do |t|
      t.string :title
      t.text :description
      t.integer :author_id
      t.string :state
      t.string :value_proposal
      t.string :application
      t.string :conditions
      t.string :obstacles

      t.timestamps
    end
  end
end
