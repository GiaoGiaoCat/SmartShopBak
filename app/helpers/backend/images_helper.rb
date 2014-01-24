module Backend::ImagesHelper
  def options_text_for(image)
    if image.variant.is_master?
      'ALL'
    else
      image.variant.sku_and_options_text
    end
  end
end
