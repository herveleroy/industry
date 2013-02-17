butterflies = <%= @butterflies %>
for k in butterflies
  $("#search_results ul").append("<li><input id='butterfly_ids_' name='butterfly_id[]'' type='checkbox' value='#{k.id}'><a href='/butterflies/#{k.id}'>#{k.title}</a></li>")

