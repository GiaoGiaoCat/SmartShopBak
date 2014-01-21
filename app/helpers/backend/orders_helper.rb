module Backend::OrdersHelper
  def select_product_tag(line_item)
    label = content_tag(:label, 'Product', class: 'col-sm-2 control-label')
    select_tag =
      content_tag(:div, class: 'col-sm-10') do
        select_tag(
          :product_id,
          options_from_collection_for_select(
            Product.all,
            "id",
            "name",
            current_product_id(line_item)
          ),
          class: 'form-control m-b product_selecter',
          prompt: "Select product"
        )
      end
    content_tag(:div, class: 'form-group') do
      label + select_tag
    end
  end

  def current_product_id(line_item)
    line_item.product.id if line_item.persisted?
  end

  def show_state(state)
    state_class =
      case state
      when "paid"
        "bg-info"
      when "shipped"
        "bg-success"
      else
        "bg-light"
      end
    content_tag(:span, state, class: "label #{state_class}")
  end

  def order_state_filter_links(state_name = nil)
    capture do
      # Order::STATES.each do |state|
      Order::ALL_STATES.each do |state|
        class_name = 'btn btn-sm btn-default'
        class_name += ' active' if state_name == state.to_s
        puts "state_name is #{state_name}"
        puts "state is #{state}"
        concat link_to(
          state.to_s.titleize,
          admin_orders_path(state: state),
          class: class_name
        )
      end
    end
  end
end
