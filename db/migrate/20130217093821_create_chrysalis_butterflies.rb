class CreateChrysalisButterflies < ActiveRecord::Migration
  def change
    create_table :chrysalis_butterflies do |t|
      t.integer :butterfly_id
      t.integer :chrysali_id

      t.timestamps
    end
  end
end
