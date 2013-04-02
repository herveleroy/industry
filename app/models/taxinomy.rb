class Taxinomy < ActiveRecord::Base
  attr_accessible :dimension, :position, :tag_id, :weight
  belongs_to :tag
end
