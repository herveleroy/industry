class IdeasCaterpillar < ActiveRecord::Base
  attr_accessible :caterpillar_id, :idea_id
  belongs_to :idea
  belongs_to :caterpillar
  validates_uniqueness_of :caterpillar_id, :scope => [:idea_id]
end
