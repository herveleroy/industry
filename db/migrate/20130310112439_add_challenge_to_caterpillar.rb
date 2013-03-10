class AddChallengeToCaterpillar < ActiveRecord::Migration
  def change
    add_column :caterpillars, :challenge, :integer
  end
end
