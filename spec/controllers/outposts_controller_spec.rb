require 'spec_helper'

describe OutpostsController do
  include Devise::TestHelpers

  def mock_outpost(stubs={})
     @mock_outpost ||= mock_model(Outpost,stubs)
  end
  
  before (:each) do
    @user = User.make

    sign_in @user
  end

  
  describe "GET index" do
    it "assigns all outposts as @outposts" do
      stub(@user).outposts { [mock_outpost] }
      get :index
      assigns(:outposts).should eq([mock_outpost])
    end
  end

  describe "GET show" do
    it "assigns the requested outpost as @outpost" do
      stub(Outpost).find("37") { mock_outpost }
      get :show, :id => "37"
      assigns(:outpost).should be(mock_outpost)
    end
  end

  describe "GET new" do
    it "assigns a new outpost as @outpost" do
      Outpost.stub(:new) { mock_outpost }
      get :new
      assigns(:outpost).should be(mock_outpost)
    end
  end

  describe "GET edit" do
    it "assigns the requested outpost as @outpost" do
      Outpost.stub(:find).with("37") { mock_outpost }
      get :edit, :id => "37"
      assigns(:outpost).should be(mock_outpost)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created outpost as @outpost" do
        Outpost.stub(:new).with({'these' => 'params'}) { mock_outpost(:save => true) }
        post :create, :outpost => {'these' => 'params'}
        assigns(:outpost).should be(mock_outpost)
      end

      it "redirects to the created outpost" do
        Outpost.stub(:new) { mock_outpost(:save => true) }
        post :create, :outpost => {}
        response.should redirect_to(outpost_url(mock_outpost))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved outpost as @outpost" do
        Outpost.stub(:new).with({'these' => 'params'}) { mock_outpost(:save => false) }
        post :create, :outpost => {'these' => 'params'}
        assigns(:outpost).should be(mock_outpost)
      end

      it "re-renders the 'new' template" do
        Outpost.stub(:new) { mock_outpost(:save => false) }
        post :create, :outpost => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested outpost" do
        Outpost.should_receive(:find).with("37") { mock_outpost }
        mock_outpost.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :outpost => {'these' => 'params'}
      end

      it "assigns the requested outpost as @outpost" do
        Outpost.stub(:find) { mock_outpost(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:outpost).should be(mock_outpost)
      end

      it "redirects to the outpost" do
        Outpost.stub(:find) { mock_outpost(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(outpost_url(mock_outpost))
      end
    end

    describe "with invalid params" do
      it "assigns the outpost as @outpost" do
        Outpost.stub(:find) { mock_outpost(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:outpost).should be(mock_outpost)
      end

      it "re-renders the 'edit' template" do
        Outpost.stub(:find) { mock_outpost(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested outpost" do
      Outpost.should_receive(:find).with("37") { mock_outpost }
      mock_outpost.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the outposts list" do
      Outpost.stub(:find) { mock_outpost }
      delete :destroy, :id => "1"
      response.should redirect_to(outposts_url)
    end
  end

end
