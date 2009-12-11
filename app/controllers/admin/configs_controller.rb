class Admin::ConfigsController < ApplicationController
  
  layout Behavior::Settings.layout
  Behavior::Settings.before_filters.each do |filter|
    before_filter filter
  end
  
  helper :behavior
  
  def show
    @configs = config.all
  end
  
  def update
    config.update(params[:conf])
    flash[:notice] = "Config Changes Saved"
    redirect_to admin_config_path
  end
  
end