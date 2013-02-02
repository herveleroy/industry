class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :firstname, :lastname, :entity_id
  attr_accessible :avatar
  has_attached_file :avatar,
    :styles => { :medium => "110X140>", :icon => "24x24>", :thumb => "60X60>" },
    :storage => :s3,
      :s3_credentials => "#{Rails.root}/config/s3.yml",
      :bucket => "ideotron";

  acts_as_voter
  belongs_to :entity
  has_many :ideas, :dependent => :destroy
  validates_presence_of :firstname, :lastname, :email, :entity_id
  validates_attachment_size :avatar, :less_than => 2.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png', 'image/gif']

  def fullname
    "#{firstname} #{lastname}"
  end
end
