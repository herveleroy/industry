class AddChallengeToButterfly < ActiveRecord::Migration
  def change
    add_column :butterflies, :challenge, :integer
  end
end
