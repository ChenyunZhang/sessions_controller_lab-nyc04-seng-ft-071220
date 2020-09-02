class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :create
  skip_before_filter :verify_authenticity_token, :only => :destroy

  def new
    
  end

  def create
    # byebug
    if params[:username].present?
      session[:name] = params[:username]
      redirect_to '/'
    else
      redirect_to controller: 'sessions', action: 'new'
    end
  end

  def destroy
    session.delete :name
    redirect_to controller: 'sessions', action: 'new'
  end
end
