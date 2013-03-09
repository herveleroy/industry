class Challenge < ActiveRecord::Base
  attr_accessible :description, :end_at, :name, :owner, :start_at, :state
end
