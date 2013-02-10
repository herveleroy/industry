class Knowledge < ActiveRecord::Base
  attr_accessible :author, :description, :title, :tag_list, :user_id, :documents_attributes
  belongs_to :user

  has_many :documents, as: :attachable, :dependent => :destroy
  accepts_nested_attributes_for :documents, :reject_if => :all_blank, :allow_destroy => true
  has_many :ideas_knowledges, :dependent => :destroy
  has_many :ideas, :through => :ideas_knowledges do
    def <<(new_item)
      super( Array(new_item) - proxy_association.owner.ideas)
    end
  end

  acts_as_taggable

  define_index do
    indexes title
    indexes description
    indexes taggings.tag.name, as: :tag_names
    has taggings.tag_id, :facet => true, as: 'tags'
    has created_at, :sort => true
    set_property field_weights: {
      title:             10,
      description:       2,
      tag_names:        10
    }
    set_property :delta => true
  end

end
