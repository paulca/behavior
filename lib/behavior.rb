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
    def meta
      HashWithIndifferentAccess.new(YAML.load_file(Behavior::Settings.config_file))
    end
    
    def [](key)
      begin
        BehaviorConfig.find_by_key(key.to_s).value
      rescue NoMethodError
        meta[key][:default]
      end
    end
    
    def all
      meta.keys
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