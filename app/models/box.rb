class Box < ActiveRecord::Base
	belongs_to :user
	belongs_to :url
	has_attached_file :image
					#, :storage => :s3,
                    #:s3_credentials => "#{Rails.root}/config/s3.yml",
                    #:bucket  => ENV['homepageimage']
	validates_attachment :image,
  :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }
end
