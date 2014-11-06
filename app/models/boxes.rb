class Boxes < ActiveRecord::Base
	belongs_to :user
	belongs_to :url
	has_attached_file :image
end
