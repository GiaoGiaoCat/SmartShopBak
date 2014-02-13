class Image < Asset
  mount_uploader :image, CoverUploader

  after_initialize :set_viewable_type

  private
    def set_viewable_type
      return unless new_record?
      self.viewable_type = 'Variant'
    end
end
