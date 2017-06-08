div.row
  div.col-sm-11
    h2 Servers
  div.col-sm-1
    a.btn.btn-success.btn-xs href="/servers/new" New
div.table-responsive
  table.table.table-striped
    thead
      tr
        th Name
        th Ip
        th Actions
    tbody
    - servers.each do |server|
      tr
        td = server.name
        td = server.ip
        td
          span
            a.btn.btn-primary.btn-xs href="/servers/#{ server.id }" read
            a.btn.btn-success.btn-xs href="/servers/#{ server.id }/edit" edit
            a.btn.btn-danger.btn-xs href="/servers/#{ server.id }?_method=delete" onclick="return confirm('Are you sure?');" delete

