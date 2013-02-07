class Task < ActiveRecord::Base
  attr_accessible :due_date, :name, :owner_id, :taskable_id, :taskable_type
  belongs_to :taskable, :polymorphic => true
end
