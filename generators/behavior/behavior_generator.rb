class BehaviorGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.directory 'db/migrate'
      m.file "20091210164854_create_behavior_configs.rb", "db/migrate/20091210164854_create_behavior_configs.rb"
      m.file "behavior.yml", "config/behavior.yml"
    end
  end
end