class LocationsController < ApplicationController
  before_filter :load_outpost_and_authorize
  
  def index
    
    @locations = @outpost.locations
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @outposts }
    end
  end
  
end
