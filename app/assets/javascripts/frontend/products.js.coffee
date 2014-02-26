# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  if $(".product-list").length > 0
    ias = jQuery.ias
      container : '.product-list'
      item: '.product-item'
      pagination: '#content .pagination'
      next: '.next a'
      negativeMargin: 100
      triggerPageThreshold: 2
