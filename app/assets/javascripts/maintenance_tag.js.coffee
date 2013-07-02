# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->

  if $("#maintenance_tag").length > 0
    $(document).delegate "#from_box li", "click", ->
      tag_name = "<li>" + $(this).html() + "</li>"
      if $("#group_id").val()  == ""
        tag_id = $(this).children().first().attr('id')
      else
        tag_id = $("#group_id").val() + "," + $(this).children().first().attr('id')
      $("#to_box ul").append(tag_name)
      $("#group_id").val(tag_id)

    Array::remove = (e) -> @[t..t] = [] if (t = @indexOf(e)) > -1

    $(document).delegate "#to_box li", "click", ->
      e = $(this).children().first().attr('id')
      string = $("#group_id").val()
      array = string.split(',')
      array.remove(e)
      $(this).remove()
      $("#group_id").val(array.toString())

    $("#raz").click ->
      $("#group_id").val("")
      $("#tag").val("")
      $("#to_box ul").empty()
      $("#target_id").val("")
      $("#from_box").empty().append("<h5>Mots clés similaires</h5><ul class = 'tags'></ul>")


