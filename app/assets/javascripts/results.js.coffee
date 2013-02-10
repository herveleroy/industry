$ ->
  $container = $("#container")
  # intialize isotope
  $("#container").isotope
    # options
    itemSelector: ".element"
    layoutMode: "masonry"

  before = $("#state").val()
  switch before
    when "pending" then state = "❙ ❙"
    when "selected" then state =  "▶"
    when "rejected" then state =  "✖"
    when "validated" then state =  "✔"
    else state = ""
  for e in $(".button-group.selection_state a")
    if $(e).text() == state
      $(e).css("background-color", "orange")
    else
      $(e).css("background-color", "#e9e9e9")

  before = $("#sorting").val()
  switch before
    when "@relevance"  then state = "Pertinence"
    when "cached_votes_score" then state =  "Score"
    when  "created_at" then state =  "Date création"
    else state = ""
  for e in $(".button-group.selection_sorting a")
    if $(e).text() == state
      $(e).css("background-color", "orange")
    else
      $(e).css("background-color", "#e9e9e9")




  button_state_reset = () ->
    for e in $(".button-group.selection_state a")
      $(e).css("background-color", "#e9e9e9")
  button_sorting_reset = () ->
    for e in $(".button-group.selection_sorting a")
      $(e).css("background-color", "#e9e9e9")


  $(".button-group.selection_state a").click ->
    before = $("#state").val()
    button_state_reset()
    click_tag = $(this).text()
    switch click_tag
      when "❙ ❙" then state = "pending"
      when "▶" then state = "selected"
      when "✖" then state = "rejected"
      when "✔" then state = "validated"
      else state = ""
    if state == before
      $(this).css("background-color",  "#e9e9e9")
      $("#state").val("")
    else
      $(this).css("background-color", "orange")
      $("#state").val(state)

  $(".button-group.selection_sorting a").click ->
    before = $("#sorting").val()
    button_sorting_reset()
    click_tag = $(this).text()
    switch click_tag
      when "Pertinence" then state = "@relevance"
      when "Score" then state = "cached_votes_score"
      when "Date création" then state = "created_at"
      else state = ""
    if state == before
      $(this).css("background-color",  "#e9e9e9")
      $("#state").val("")
    else
      $(this).css("background-color", "orange")
      $("#sorting").val(state)



