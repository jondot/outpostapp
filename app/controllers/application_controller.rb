class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
 
  
  
protected
  def load_outpost_and_authorize
    id = params[:id] || params[:outpost_id]
    @outpost = Outpost.find(id)
    unauthorized! if @outpost.user != current_user
  end
  def unauthorized!
    redirect_to :unauthorized
  end  
end
