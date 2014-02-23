module Backend::ImagesHelper
  def options_text_for(image)
    if image.viewable.is_master?
      'ALL'
    else
      image.viewable.sku_and_options_text
    end
  end
end
