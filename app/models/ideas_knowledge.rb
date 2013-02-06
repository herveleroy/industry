class IdeasKnowledge < ActiveRecord::Base
  attr_accessible :idea_id, :knowledge_id
  belongs_to :idea
  belongs_to :knowledge
  validates_uniqueness_of :knowledge_id, :scope => [:idea_id]
end
