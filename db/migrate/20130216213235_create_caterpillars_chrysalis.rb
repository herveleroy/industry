class CreateCaterpillarsChrysalis < ActiveRecord::Migration
  def change
    create_table :caterpillars_chrysalis do |t|
      t.integer :caterpillar_id
      t.integer :chrysali_id

      t.timestamps
    end
    add_index "caterpillars_chrysalis", "caterpillar_id"
    add_index "caterpillars_chrysalis", "chrysali_id"
  end
end
