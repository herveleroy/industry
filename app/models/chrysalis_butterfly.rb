class ChrysalisButterfly < ActiveRecord::Base
  attr_accessible :butterfly_id, :chrysali_id
  belongs_to :butterfly
  belongs_to :chrysali
  validates_uniqueness_of :butterfly_id, :scope => [:chrysali_id]
end
