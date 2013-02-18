class Caterpillar < ActiveRecord::Base
  attr_accessible :application, :author_id, :description, :title, :tag_list
  attr_accessible :state
  belongs_to :user, :foreign_key => 'author_id'

  has_many :caterpillars_knowledges, :dependent => :destroy
  has_many :knowledges, :through => :caterpillars_knowledges do
    def <<(new_item)
      super( Array(new_item) - proxy_association.owner.knowledges)
    end
  end

  has_many :ideas_caterpillars, :dependent => :destroy
  has_many :ideas, :through => :ideas_caterpillars do
    def <<(new_item)
      super( Array(new_item) - proxy_association.owner.ideas)
    end
  end

  has_many :caterpillars_chrysalis, :dependent => :destroy
  has_many :chrysalis, :through => :caterpillars_chrysalis do
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
    indexes application
    indexes state
    indexes taggings.tag.name, as: :tag_names
    has taggings.tag_id, :facet => true, as: 'tags'
    has created_at, :sort => true
    has cached_votes_score
    has state, :as => :object_state
    set_property field_weights: {
      title:             10,
      description:       2,
      application:       2,
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
