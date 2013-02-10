$ ->
  for elem in $("input.clickable_tag:checked")
    $(elem).parent().addClass("highlight")


  $("input.clickable_tag").change ->
    label = $(this).parent()
    if  label.hasClass("highlight")
      label.removeClass("highlight")
    else
      label.addClass("highlight")

  $("input.clickable_box").change ->
    box = $(this).parent().parent()
    if $(this).attr('checked')
      box.css("background-color", "PaleTurquoise")
      array = []
      array.push $("#new_tag_id").val() unless $("#new_tag_id").val().length == 0
      array.push box.find(".the_id").text()
      $("#new_tag_id").val(array)

    else
      box.css("background-color", "#F2F2F2")


