class Content < ApplicationRecord
	before_save :update_asset_attributes
	belongs_to :course
	mount_uploader :attachment, AttachmentUploader
	validates :name, presence: true

	private
  
		def update_asset_attributes
		    if attachment.present? && attachment_changed?
		      self.content_type = attachment.file.content_type
		      self.size = attachment.file.size
			end
  		end
end
