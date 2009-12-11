require File.dirname(__FILE__) + '/../spec_helper'

describe BehaviorHelper do
  include BehaviorHelper
  include Behavior
  
  before do
    Behavior::Settings.config_file = 'config/behavior.yml'
  end
  
  it "should give me a password field for a password" do
    behavior_tag('password').should match(/type="password"/)
  end
  
  it "should give me a text area field for text" do
    behavior_tag('description').should match(/textarea/)
  end
end