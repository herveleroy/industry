class Idea < ActiveRecord::Base
  attr_accessible :author_id, :description, :title
  acts_as_votable
end
