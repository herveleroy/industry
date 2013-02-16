class ChrysalisKnowledge < ActiveRecord::Base
  attr_accessible :chrysali_id, :knowledge_id
  belongs_to :chrysali
  belongs_to :knowledge
  validates_uniqueness_of :knowledge_id, :scope => [:chrysali_id]
end
