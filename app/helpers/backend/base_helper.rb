module Backend::BaseHelper
  def navigation_link(text, url, badges = nil)
    link_to url do
      if badges.is_a?(Hash)
        concat content_tag(:b, badges[:count], class: "badge #{badges[:class]} pull-right")
      end
      concat content_tag(:i, nil, class: 'fa fa-angle-right')
      concat content_tag(:span, text)
    end
  end

  def navigation_link_has_children(text, url)
    link_to url do
      concat content_tag(:i, nil, class: 'fa fa-angle-down text')
      concat content_tag(:i, nil, class: 'fa fa-angle-up text-active')
      concat content_tag(:span, text)
    end
  end

  def active_rules(rules)
    return if rules.blank?
    rules.each do |rule|
      return 'active' if request.fullpath.to_s =~ /\/admin\/#{rule}/
    end
  end

  def show_flash_messages
    return if flash.blank?
    flash.each do |key, value|
      content = content_tag(:button, "x", class: 'close', "data-dismiss" => 'alert')
      # content += content_tag(:h4, "Oh...")
      content += value
      class_name = (key == :notice ? "alert alert-success m" : "alert alert-warning")
      return content_tag(:div, content, class: class_name)
    end
  end

  def render_breadcrumb
    render(
      :partial => 'application/breadcrumb',
      :locals => { :title => controller_name.titleize }
    )
  end
end
