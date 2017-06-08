require "granite_orm/adapter/pg"

class Server < Granite::ORM 
  adapter pg

  # id : Int64 primary key is created for you
  field name : String
  field ip : String
  timestamps
end
