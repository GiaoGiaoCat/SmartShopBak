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
      clientSideStorage: false

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


attachImageUploaderHandler = ->
  $("#product_upload_images").click()
  # $("#attachments .links a").click()
  # $("#attachments .nested-fields:last input[type='file']").click()
  # initUploader : () ->
  #   $("#topic_add_image").bind "click", () ->
  #     $(".topic_editor").focus()
  #     $("#topic_upload_images").click()
  #     return false

  #   opts =
  #     url : "/photos"
  #     type : "POST"
  #     beforeSend : () ->
  #       $("#detail_add_image").hide()
  #       $("#detail_add_image").before("<span class='loading'>上传中...</span>")
  #     success : (result, status, xhr) ->
  #       $("#detail_add_image").parent().find("span.loading").remove()
  #       $("#detail_add_image").show()
  #       Topics.appendImageFromUpload([result])

  #   $("#topic_upload_images").fileUpload opts
  #   return false

$(document).on 'click', '#detail_add_image', attachImageUploaderHandler
