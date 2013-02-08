class Document < ActiveRecord::Base
  attr_accessible :attachable_id, :name, :upload, :attachable_type
  belongs_to :attachable, :polymorphic => true
  has_attached_file :upload,
    :storage => :s3,
      :styles => { :medium => "110X140>", :icon => "24x24>" },
      :path => ":attachment/:id/:style.:extension",
      :default_url => '/images/missing_:style.png',
      :default_style => :icon,
      :whiny => false,
      :s3_credentials => "#{Rails.root}/config/s3.yml",
        :path => ":attachment/:id/:style.:extension",
        :bucket => "ideotron"

end

