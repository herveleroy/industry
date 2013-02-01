class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :firstname, :lastname, :entity_id
  acts_as_voter
  belongs_to :entity
  has_many :ideas, :dependent => :destroy
  validates_presence_of :firstname, :lastname, :email, :entity_id

  def fullname
    "#{firstname} #{lastname}"
  end
end
