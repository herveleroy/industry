# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->

  $("a.close").click ->
    box = $(this).parent()
    if(box.find("li").length == 0)
      $(this).parent().remove()



  $("#add_dimension").click ->
      dimension_name = $("#dimension_title").val()
      dimension_name_id = dimension_name.split(" ").join("_")
      if(dimension_name)
        new_box = "<div class='dimension_drop droppable'>#{dimension_name}<ul id= #{dimension_name_id}></ul></div>"
        $("#dimension_store").append(new_box)
        $(".droppable:last").droppable
          drop: (event, ui) ->
            id = ui.draggable.find("input").val()
            deleteElement( ui.draggable )
            dimension = $(this).find("ul").attr('id')

            $.post '/add_tag_to_dimension',
              tag_id: id
              dimension: dimension.split("_").join(" ")

              (data) ->
                console.log data
                link = "<a href='/tags/#{data.tag.id}'>#{data.tag.name}</a>"
                elem = "<li><a href='#' class='trash'>☒</a>" + link + "<input type= 'hidden' value = '#{id}' ></li>"
                drop_box = $("##{data.dimension.split(" ").join("_")}")
                drop_box.append(elem)



  $("body").on "click", "a.trash", ->
    restoreElement(this)


  $( ".draggable" ).draggable
    revert: "invalid"
    cursor: "move"


  $(".droppable").droppable

    drop: (event, ui) ->
      id = ui.draggable.find("input").val()
      deleteElement( ui.draggable )
      dimension = $(this).find("ul").attr('id')

      $.post '/add_tag_to_dimension',
        tag_id: id
        dimension: dimension.split("_").join(" ")

        (data) ->
          console.log data
          link = "<a href='/tags/#{data.tag.id}'>#{data.tag.name}</a>"
          elem = "<li><a href='#' class='trash'>☒</a>" + link + "<input type= 'hidden' value = '#{id}' ></li>"
          drop_box = $("##{data.dimension.split(" ").join("_")}")
          drop_box.append(elem)



  deleteElement = ($item) ->
    $item.fadeOut ->
     $item.remove()

  restoreElement = (item) ->
    elem = $(item).parent()
    id = elem.find("input").val()
    elem.remove()
    $.post '/remove_tag_from_dimension',
        tag_id: id
        (data) ->
          console.log data
          link = "<a href='/tags/#{id}'>#{data.tag.name}</a>"
          rule = "<div class='element_small draggable'>" + link + "<input type= 'hidden' value = '#{id}' ></div>"
          $("#store").append(rule)
          $(".draggable:last").draggable
            revert: "invalid"
            cursor: "move"


