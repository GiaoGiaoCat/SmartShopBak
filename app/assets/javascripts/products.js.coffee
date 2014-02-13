# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  if $.fn.select2
    $("#product_option_type_ids").select2()

  if $("#epiceditor").length > 0
    opts =
      basePath: "/assets/"
      theme:
        base: "markdown/epiceditor.css"
        preview: "markdown/bartik.css"
        editor: "markdown/epic-light.css"
      button: false

    editor = new EpicEditor(opts).load()

    attachEditModeHandler = ->
      editor.edit()
    attachPreviewModeHandler = ->
      editor.preview()

    $(document).on 'click', '#editor-edit-btn', attachEditModeHandler
    $(document).on 'click', '#editor-preview-btn', attachPreviewModeHandler


attachGetOptionTypesHandler = ->
  $this = $(this)
  prototype_id = $("option:selected", $(this)).val()
  $.ajax
    type: 'GET'
    url: "/admin/prototypes/" + prototype_id
    dataType: 'script'

$(document).on 'change', '#product_prototype_id', attachGetOptionTypesHandler

