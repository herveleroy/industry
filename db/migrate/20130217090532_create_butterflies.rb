class CreateButterflies < ActiveRecord::Migration
  def change
    create_table :butterflies do |t|
      t.string :title
      t.text :description
      t.integer :author_id
      t.string :customer_segments
      t.string :value_proposal
      t.string :channels
      t.string :customer_relationship
      t.string :key_resources
      t.string :key_activities
      t.string :key_partnerships
      t.string :revenue_streams
      t.string :cost_structure

      t.timestamps
    end
  end
end
