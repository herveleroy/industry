event = "<%= @event %>"
switch event
  when "pending" then $("#status").removeClass().addClass("pending")
  when "rejected" then $("#status").removeClass().addClass("rejected")
  when "selected" then $("#status").removeClass().addClass("selected")
  when "validated" then $("#status").removeClass().addClass("validated")
