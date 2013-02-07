class AddUserToKnowledge < ActiveRecord::Migration
  def change
    add_column :knowledges, :user_id, :integer
  end
end
