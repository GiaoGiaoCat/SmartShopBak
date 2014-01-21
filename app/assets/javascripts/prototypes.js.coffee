# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  if $.fn.select2
    $("#prototype_property_ids").select2()
    $("#prototype_option_type_ids").select2()
