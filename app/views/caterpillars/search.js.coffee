caterpillars = <%= @caterpillars %>
for k in caterpillars
  $("#search_results ul").append("<li><input id='caterpillar_ids_' name='caterpillar_id[]'' type='checkbox' value='#{k.id}'><a href='/caterpillars/#{k.id}'>#{k.title}</a></li>")

