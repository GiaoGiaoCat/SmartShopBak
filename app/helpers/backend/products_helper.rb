module Backend::ProductsHelper
  def number_to_money(number, currency)
    locale, unit =
      case currency
      when "en"
        [:en, "$"]
      else
        [:cn, "￥"]
      end
    # number_to_currency(number, locale: local, unit: unit)
    number_to_currency(number, unit: unit)
  end

  # Set a class when on current page by `current_class`.
  def link_to_unless_current_page(options = {}, html_options = {}, &block)
    if current_page?(options) || request.url =~ /#{options}/
      html_options[:class] += " #{html_options[:current_class]}"
    end
    link_to(options, html_options, &block)
  end

  def thumb_image(product)
    if product.images && !product.images.size.zero?
      image_tag product.images.first.image_url(:thumb), class: 'b-a'
    end
  end
end
