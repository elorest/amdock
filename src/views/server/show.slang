p = server.name
p = server.ip
p
  a.btn.btn-default.btn-xs href="/servers" back
  a.btn.btn-success.btn-xs href="/servers/#{ server.id }/edit" edit
  a.btn.btn-danger.btn-xs href="/servers/#{ server.id }?_method=delete" onclick="return confirm('Are you sure?');" delete
