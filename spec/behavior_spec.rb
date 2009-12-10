require File.dirname(__FILE__) + '/spec_helper'

describe Behavior::Configuration do

  load_schema
  include Behavior
  
  before do
    Behavior::Settings.config_file = 'config/behavior.yml'
    BehaviorConfig.make(:key => 'email_address', :value => 'paul@rslw.com')
  end
  
  describe ".config" do
    it "should wonder why" do
      config.should be_a_kind_of(Behavior::Configuration)
    end
    
    it "should allow accessing the config" do
      config[:email_address][:name].should == "Email Address"
    end
    
    it "should give me all the keys" do
      config.all.should == ["email_address"]
    end
  end
  
end