class Task < ActiveRecord::Base
  attr_accessible :due_date, :name, :owner_id, :taskable_id, :taskable_type, :description, :importance, :accessibility
  belongs_to :taskable, :polymorphic => true
  belongs_to :user, :foreign_key => 'owner_id'
end
