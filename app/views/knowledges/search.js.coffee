knowledges = <%= @knowledges %>
for k in knowledges
  $("#search_results ul").append("<li><input id='knowledge_ids_' name='knowledge_id[]'' type='checkbox' value='#{k.id}'><a href='/knowledges/#{k.id}'>#{k.title}</a></li>")

