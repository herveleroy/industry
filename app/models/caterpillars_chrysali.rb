class CaterpillarsChrysali < ActiveRecord::Base
  attr_accessible :chrysali_id, :caterpillar_id
  belongs_to :chrysali
  belongs_to :caterpillar
  validates_uniqueness_of :chrysali_id, :scope => [:caterpillar_id]
end
