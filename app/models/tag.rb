class Tag < ActiveRecord::Base
  attr_accessible :name, :taxon
  has_many :taggings, :dependent => :destroy
  has_one :taxinomy, :dependent => :destroy
  define_index do
    indexes name,  :as => :name
  end
end
