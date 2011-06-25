class OutpostsController < ApplicationController
  before_filter :load_outpost_and_authorize, :except => [:index, :new, :create]
  
  # GET /outposts
  # GET /outposts.xml
  def index
    @outposts = current_user.outposts

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @outposts }
    end
  end

  # GET /outposts/1
  # GET /outposts/1.xml
  def show
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @outpost }
    end
  end

  # GET /outposts/new
  # GET /outposts/new.xml
  def new
    @outpost = Outpost.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @outpost }
    end
  end

  # GET /outposts/1/edit
  def edit
  end

  # POST /outposts
  # POST /outposts.xml
  def create
    @outpost = current_user.outposts.build(params[:outpost])
    
    respond_to do |format|
      if @outpost.save
        format.html { redirect_to(@outpost, :notice => 'Outpost was successfully created.') }
        format.xml  { render :xml => @outpost, :status => :created, :location => @outpost }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @outpost.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /outposts/1
  # PUT /outposts/1.xml
  def update
    
    respond_to do |format|
      if @outpost.update_attributes(params[:outpost])
        format.html { redirect_to(@outpost, :notice => 'Outpost was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @outpost.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /outposts/1
  # DELETE /outposts/1.xml
  def destroy
  
    @outpost.destroy

    respond_to do |format|
      format.html { redirect_to(outposts_url) }
      format.xml  { head :ok }
    end
  end
  

end
