class Pin < ActiveRecord::Base
	belongs_to :user
	has_attached_file :image, 
										:styles => { :medium => "300x300>", :thumb => "100x100>"},
										:storage => :s3,
										:bucket => 'PinterestingTrial',
										:s3_credentials => {:access_key_id => ENV['S3_KEY'], :secret_access_key => ENV['S3_SECRET']}

  validates_attachment :image, presence: true
  validates :user_id, presence: true
  has_attached_file :image, styles: { medium: "320x240>"}
  validates_attachment :image, presence: true,
                            content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                            size: { less_than: 5.megabytes }
  belongs_to :user

end

