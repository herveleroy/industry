class ButterfliesKnowledge < ActiveRecord::Base
  attr_accessible :butterfly_id, :knowledge_id
  belongs_to :butterfly
  belongs_to :knowledge
  validates_uniqueness_of :knowledge_id, :scope => [:butterfly_id]
end
