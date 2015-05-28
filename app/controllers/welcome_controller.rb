class WelcomeController < ApplicationController

  def index
    if user_signed_in?
      redirect_to :controller => 'main', :action => 'index', :status => 301
    end
  end

end
