require "rails_helper"

RSpec.describe ProgresstablesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/progresstables").to route_to("progresstables#index")
    end

    it "routes to #new" do
      expect(:get => "/progresstables/new").to route_to("progresstables#new")
    end

    it "routes to #show" do
      expect(:get => "/progresstables/1").to route_to("progresstables#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/progresstables/1/edit").to route_to("progresstables#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/progresstables").to route_to("progresstables#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/progresstables/1").to route_to("progresstables#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/progresstables/1").to route_to("progresstables#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/progresstables/1").to route_to("progresstables#destroy", :id => "1")
    end
  end
end
