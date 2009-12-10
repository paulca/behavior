require 'active_support'
# Behavior
module Behavior
  def self.included(base)
    base.class_eval do
      def config
        Behavior::Configuration.new
      end
    end
  end
  
  class Configuration
    def config
      HashWithIndifferentAccess.new(YAML.load_file(Behavior::Settings.config_file))
    end
    
    def [](key)
      config[key]
    end
    
    def all
      config.keys
    end
  end
  
  class Settings
    class << self
      def config_file
        @config_file ||= "#{Rails.root}/config/behavior.yml"
      end
      
      def config_file=(file)
        @config_file = file
      end
    end
  end
  
end

ActionController::Base.send(:include, Behavior)