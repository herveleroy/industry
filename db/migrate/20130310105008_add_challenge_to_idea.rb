class AddChallengeToIdea < ActiveRecord::Migration
  def change
    add_column :ideas, :challenge, :integer
  end
end
