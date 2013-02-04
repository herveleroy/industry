class Idea < ActiveRecord::Base
  attr_accessible :author_id, :description, :title, :tag_list
  belongs_to :user, :foreign_key => 'author_id'
  acts_as_votable
  acts_as_taggable
  acts_as_commentable
end
