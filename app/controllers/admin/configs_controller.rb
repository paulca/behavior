class Admin::ConfigsController < ActionController::Base
  
  helper :all
  
  def show
    @configs = config.all
  end
  
end