class CaterpillarsKnowledge < ActiveRecord::Base
  attr_accessible :caterpilar_id, :knowledge_id
  belongs_to :caterpillar
  belongs_to :knowledge
  validates_uniqueness_of :knowledge_id, :scope => [:caterpillar_id]
end
