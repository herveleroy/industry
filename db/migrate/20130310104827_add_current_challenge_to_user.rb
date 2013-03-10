class AddCurrentChallengeToUser < ActiveRecord::Migration
  def change
    add_column :users, :current_challenge, :integer
  end
end
