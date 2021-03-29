class Attachment < ApplicationRecord
  mount_uploader :upload, AttachmentUploader

  before_create :set_t

  def full_url(size = :full)
    size == :full ? upload.url : upload.url(size)
  end

  private
  def set_t
    self.t = SecureRandom.hex(3)
  end
end
