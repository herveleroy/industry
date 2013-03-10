class AddChallengeToChrysali < ActiveRecord::Migration
  def change
    add_column :chrysalis, :challenge, :integer
  end
end
