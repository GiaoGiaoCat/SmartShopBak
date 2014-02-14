class Attachment < Asset
  mount_uploader :image, ImageUploader

  after_initialize :set_viewable_type

  private
    def set_viewable_type
      return unless new_record?
      self.viewable_type = 'Product'
    end
end
