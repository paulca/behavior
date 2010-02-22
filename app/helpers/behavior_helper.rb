module BehaviorHelper
  
  def behavior_tag(conf)
    case config.meta[conf][:type]
    when 'text'
      text_area_tag("conf[#{conf}]", config[conf], :id => conf)
    when 'password'
      password_field_tag("conf[#{conf}]", config[conf], :id => conf)
    when 'select'
      select_tag("conf[#{conf}]", options_for_select(config.meta[conf][:options]), :id => conf)
    else
      text_field_tag("conf[#{conf}]", config[conf], :id => conf)
    end
  end
end