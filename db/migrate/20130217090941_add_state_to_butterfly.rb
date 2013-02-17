class AddStateToButterfly < ActiveRecord::Migration
  def change
    add_column :butterflies, :state, :string
  end
end
