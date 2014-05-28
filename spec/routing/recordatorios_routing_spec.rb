require "spec_helper"

describe RecordatoriosController do
  describe "routing" do

    it "routes to #index" do
      get("/recordatorios").should route_to("recordatorios#index")
    end

    it "routes to #new" do
      get("/recordatorios/new").should route_to("recordatorios#new")
    end

    it "routes to #show" do
      get("/recordatorios/1").should route_to("recordatorios#show", :id => "1")
    end

    it "routes to #edit" do
      get("/recordatorios/1/edit").should route_to("recordatorios#edit", :id => "1")
    end

    it "routes to #create" do
      post("/recordatorios").should route_to("recordatorios#create")
    end

    it "routes to #update" do
      put("/recordatorios/1").should route_to("recordatorios#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/recordatorios/1").should route_to("recordatorios#destroy", :id => "1")
    end

  end
end
