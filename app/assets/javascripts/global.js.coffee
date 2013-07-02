$ ->

  highlight_tag = () ->
    tags = []
    for elem in $("input.clickable_tag:checked")
      $(elem).parent().addClass("highlight")
      tags.push $(elem).attr("data-filter")
    tags_filter = tags.toString()
    tags_filter = "*" if tags_filter.length == 0
    $("#container").isotope
      filter: tags_filter


  highlight_tag()

  $("input.clickable_tag").change ->
    label = $(this).parent()
    if  label.hasClass("highlight")
      label.removeClass("highlight")
    else
      label.addClass("highlight")
    highlight_tag()

  $("input.clickable_box").change ->
    box = $(this).parent().parent()
    if $(this).prop('checked')
      box.css("background-color", "PaleTurquoise")
      array = []
      array.push $("#new_tag_id").val() unless $("#new_tag_id").val().length == 0
      array.push box.find(".the_id").text()
      $("#new_tag_id").val(array)
      $("#transform_id").val(array)

    else
      box.css("background-color", "#F2F2F2")


