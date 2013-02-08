class Caterpillar < ActiveRecord::Base
  attr_accessible :application, :author_id, :description, :title, :tag_list
  attr_accessible :state
  belongs_to :user, :foreign_key => 'author_id'

  has_many :caterpillars_knowledges
  has_many :knowledges, :through => :caterpillars_knowledges do
    def <<(new_item)
      super( Array(new_item) - proxy_association.owner.knowledges)
    end
  end

  has_many :ideas_caterpillars
  has_many :ideas, :through => :ideas_caterpillars do
    def <<(new_item)
      super( Array(new_item) - proxy_association.owner.ideas)
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

  # scope :pending, where({ state: :pending })
  # scope :selected, where({ state: :selected })
  # scope :validated, where({ state: :validated })
  # scope :rejected, where({ state: :rejected })

  state_machine :state, :initial => :pending do

    state :pending
    state :selected
    state :validated
    state :rejected

    event :do_select do
      transition [:pending , :rejected]=> :selected
    end

    event :do_validate do
      transition [:pending, :selected] => :validated
    end

    event :do_reject do
      transition [:pending] => :rejected
    end

  end

  def mark_as_selected
    write_attribute :read_at, Time.now
  end

  def mark_as_validated
    write_attribute :accepted, true
    write_attribute :accepted_at, Time.now
  end

  def mark_as_rejected
    write_attribute :accepted, false
    write_attribute :accepted_at, Time.now
  end

end
