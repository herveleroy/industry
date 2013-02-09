ideas = <%= @ideas %>
for k in ideas
  $("#search_results ul").append("<li><input id='idea_ids_' name='idea_id[]'' type='checkbox' value='#{k.id}'><a href='/ideas/#{k.id}'>#{k.title}</a></li>")
