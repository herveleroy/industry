$ ->
  for elem in $("input:checked")
    $(elem).parent().addClass("highlight")

  $("input.clickable_tag").change ->
    label = $(this).parent()
    if  label.hasClass("highlight")
      label.removeClass("highlight")
    else
      label.addClass("highlight")

