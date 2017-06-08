require "./spec_helper"

def create_subject
  subject = Server.new
  subject.name = "test"
  subject.save
  subject
end

describe ServerController do
  Spec.before_each do
    Server.clear
  end

  describe ServerController::Index do
    it "renders all the servers" do
      subject = create_subject
      get "/servers"
      response.body.should contain "test"
    end
  end

  describe ServerController::Show do
    it "renders a single server" do
      subject = create_subject
      get "/servers/#{subject.id}"
      response.body.should contain "test"
    end
  end

  describe ServerController::New do
    it "render new template" do
      get "/servers/new"
      response.body.should contain "New Server"
    end
  end

  describe ServerController::Create do
    it "creates a server" do
      post "/servers", body: "name=testing"
      subject_list = Server.all
      subject_list.size.should eq 1
    end
  end

  describe ServerController::Edit do
    it "renders edit template" do
      subject = create_subject
      get "/servers/#{subject.id}/edit"
      response.body.should contain "Edit Server"
    end
  end

  describe ServerController::Update do
    it "updates a server" do
      subject = create_subject
      patch "/servers/#{subject.id}", body: "name=test2"
      result = Server.find(subject.id).not_nil!
      result.name.should eq "test2"
    end
  end

  describe ServerController::Delete do
    it "deletes a server" do
      subject = create_subject
      delete "/servers/#{subject.id}"
      result = Server.find subject.id
      result.should eq nil
    end
  end
end
