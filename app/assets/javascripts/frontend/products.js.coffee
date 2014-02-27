# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  if $(".product-list").length > 0
    ias = $.ias
      container : '.product-list'
      item: '.product-item'
      pagination: '#content .pagination'
      next: '.next a'
      negativeMargin: 100

    # FIXME [issue #58]
    # ias.extension new IASSpinnerExtension()
    # ias.extension(new IASNoneLeftExtension({html: '<li style="text-align:center"><p><em>You reached the end!</em></p></li>'}))
    # return
