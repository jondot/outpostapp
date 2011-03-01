require "spec_helper"

describe OutpostsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/outposts" }.should route_to(:controller => "outposts", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/outposts/new" }.should route_to(:controller => "outposts", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/outposts/1" }.should route_to(:controller => "outposts", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/outposts/1/edit" }.should route_to(:controller => "outposts", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/outposts" }.should route_to(:controller => "outposts", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/outposts/1" }.should route_to(:controller => "outposts", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/outposts/1" }.should route_to(:controller => "outposts", :action => "destroy", :id => "1")
    end

  end
end
