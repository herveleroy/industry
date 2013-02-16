chrysalis = <%= @chrysalis %>
for k in chrysalis
  $("#search_results ul").append("<li><input id='chrysali_ids_' name='chrysali_id[]'' type='checkbox' value='#{k.id}'><a href='/chrysalis/#{k.id}'>#{k.title}</a></li>")

