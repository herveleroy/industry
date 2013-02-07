class Caterpillar < ActiveRecord::Base
  attr_accessible :application, :author_id, :description, :title, :tag_list
  belongs_to :user, :foreign_key => 'author_id'
  has_many :caterpillars_knowledges
  has_many :knowledges, :through => :caterpillars_knowledges do
    def <<(new_item)
      super( Array(new_item) - proxy_association.owner.knowledges)
    end
  end

  acts_as_votable
  acts_as_taggable
  acts_as_commentable

  define_index do
    indexes title
    indexes description
    indexes application
    indexes taggings.tag.name, as: :tag_names
    has taggings.tag_id, :facet => true, as: 'tags'
    has created_at, :sort => true
    set_property field_weights: {
      title:             10,
      description:       2,
      application:       2,
      tag_names:        10
    }
    set_property :delta => true
  end

end