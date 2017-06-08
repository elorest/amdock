- if server.errors
  ul.errors
  - server.errors.each do |error|
    li = error

- action = (server.id ? "/servers/" + server.id.to_s : "/servers")
form action="#{ action }" method="post"
  - if server.id
    input type="hidden" name="_method" value="patch"
  div.form-group
    input.form-control type="text" name="name" placeholder="Name" value="#{ server.name }"
  div.form-group
    input.form-control type="text" name="ip" placeholder="Ip" value="#{ server.ip }"
  button.btn.btn-primary.btn-xs type="submit" Submit
  a.btn.btn-default.btn-xs href="/servers" back
