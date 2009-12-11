module BehaviorHelper
  
  def behavior_tag(conf)
    return text_area_tag("conf[#{conf}]", config[conf], :id => conf) if config.meta[conf][:type] == 'text'
    return password_field_tag("conf[#{conf}]", config[conf], :id => conf) if config.meta[conf][:type] == 'password'
    text_field_tag("conf[#{conf}]", config[conf], :id => conf)
  end
end