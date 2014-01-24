# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

attachGetOptionTypesHandler = ->
  $this = $(this)
  prototype_id = $("option:selected", $(this)).val()
  $.ajax
    type: 'GET'
    url: "/admin/prototypes/" + prototype_id
    dataType: 'script'

$(document).on 'change', '#product_prototype_id', attachGetOptionTypesHandler

$ ->
  if $.fn.select2
    $("#product_option_type_ids").select2()
