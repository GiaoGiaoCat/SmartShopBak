# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

attachGetVariantsHandler = ->
  $this = $(this)
  product_id = $("option:selected", $(this)).val()
  $.ajax
    type: 'GET'
    url: "/admin/products/" + product_id + "/variants"
    dataType: 'json'
    success: (data,textStatus,jqXHR) ->
      variant_id_element = $this.parents(".nested-fields").find('.variant_selecter')
      variant_id_element.empty()
      $.each data, (index, item) ->
        variant_id_element.append(new Option(item.sku, item.id))
      $('.variant_selecter', $this.parents(".nested-fields")).change()

attachGetVariantPriceHandler = ->
  $this = $(this)
  variant_id = $("option:selected", $(this)).val()
  $.ajax
    type: 'GET'
    url: "/admin/variants/" + variant_id
    dataType: 'json'
    success: (data,textStatus,jqXHR) ->
      variant_price_element = $this.parents(".nested-fields").find('.price_input')
      variant_price_element.val(data.price)

attachChangeStateHandler = (e)->
  e.preventDefault()
  $this = $(this)
  form = $this.parents("form")
  state = form.find("#state").val()

  order_ids = $("input[name='ids[]']:checked").map(->
    @value
  ).get()

  $.ajax
    type: 'POST'
    url: form.attr("action")
    dataType: 'script'
    data: { ids: order_ids, state: state }

# $ ->
$(document).on 'change', '.product_selecter', attachGetVariantsHandler
$(document).on 'change', '.variant_selecter', attachGetVariantPriceHandler
$(document).on 'click', '#change_state_btn', attachChangeStateHandler

