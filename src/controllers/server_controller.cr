class ServerController < Amber::Controller::Base
  def index
    servers = Server.all
    render("index.slang")
  end

  def show
    if server = Server.find params["id"]
      render("show.slang")
    else
      flash["warning"] = "Server with ID #{params["id"]} Not Found"
      redirect_to "/servers"
    end
  end

  def new
    server = Server.new
    render("new.slang")
  end

  def create
  server = Server.new(params.to_h.select(["name", "ip"]))

    if server.valid? && server.save
      flash["success"] = "Created Server successfully."
      redirect_to "/servers"
    else
      flash["danger"] = "Could not create Server!"
      render("new.slang")
    end
  end

  def edit
    if server = Server.find params["id"]
      render("edit.slang")
    else
      flash["warning"] = "Server with ID #{params["id"]} Not Found"
      redirect_to "/servers"
    end
  end

  def update
    if server = Server.find(params["id"])
      server.set_attributes(params.to_h.select(["name", "ip"])) 
      if server.valid? && server.save
        flash["success"] = "Updated Server successfully."
        redirect_to "/servers"
      else
        flash["danger"] = "Could not update Server!"
        render("edit.slang")
      end
    else
      flash["warning"] = "Server with ID #{params["id"]} Not Found"
      redirect_to "/servers"
    end
  end

  def destroy
    if server = Server.find params["id"]
      server.destroy
    else
      flash["warning"] = "Server with ID #{params["id"]} Not Found"
    end
    redirect_to "/servers"
  end
end
