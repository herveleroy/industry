class Challenge < ActiveRecord::Base
  attr_accessible :description, :end_at, :name, :owner_id, :start_at, :state
  belongs_to :user, :foreign_key => 'owner_id'
   validates_presence_of :description,  :name
end
