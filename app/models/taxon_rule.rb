class TaxonRule < ActiveRecord::Base
  attr_accessible :tags, :taxon
  serialize :tags
end
