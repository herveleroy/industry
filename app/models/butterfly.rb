class Butterfly < ActiveRecord::Base
  attr_accessible :author_id, :channels, :cost_structure, :customer_relationship, :customer_segments, :description, :key_activities, :key_partnerships, :key_resources, :revenue_streams, :title, :value_proposal
  attr_accessible :state, :tag_list
  belongs_to :user, :foreign_key => 'author_id'

  has_many :butterflies_knowledges, :dependent => :destroy
  has_many :knowledges, :through => :butterflies_knowledges do
    def <<(new_item)
      super( Array(new_item) - proxy_association.owner.knowledges)
    end
  end

  has_many :chrysalis_butterflies, :dependent => :destroy
  has_many :chrysalis, :through => :chrysalis_butterflies do
    def <<(new_item)
      super( Array(new_item) - proxy_association.owner.chrysalis)
    end
  end

  has_many :tasks, as: :taskable, :dependent => :destroy

  acts_as_votable
  acts_as_taggable
  acts_as_commentable

  define_index do
    indexes title
    indexes description
    indexes channels
    indexes customer_segments
    indexes key_activities
    indexes key_partnerships
    indexes key_resources
    indexes customer_relationship
    indexes value_proposal
    indexes revenue_streams
    indexes cost_structure
    indexes state
    indexes taggings.tag.name, as: :tag_names
    has taggings.tag_id, :facet => true, as: 'tags'
    has created_at, :sort => true
    has cached_votes_score
    has state, :as => :object_state
    set_property field_weights: {
      title:             10,
      description:       2,
      value_proposal: 2,
      channels:       2,
      customer_segments:   2,
      key_activities: 2,
      key_partnerships: 2,
      key_resources: 2,
      customer_relationship: 2,
      revenue_streams: 2,
      cost_structure: 2,
      tag_names:        10
    }
    set_property :delta => true
  end

  # scope :pending, where({ state: :pending })
  # scope :selected, where({ state: :selected })
  # scope :validated, where({ state: :validated })
  # scope :rejected, where({ state: :rejected })

  state_machine :state, :initial => :pending do

    # state :pending
    # state :selected
    # state :validated
    # state :rejected

    event :do_select do
      transition all => :selected
    end

    event :do_validate do
      transition all => :validated
    end

    event :do_reject do
      transition all => :rejected
    end

    event :do_pause do
      transition all => :pending
    end

  end

end
