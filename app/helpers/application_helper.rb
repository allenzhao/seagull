module ApplicationHelper

  def enum_to_human(enum)
    I18n.t(:"enum.#{enum}", default: enum.to_s.humanize) unless enum.blank?
  end

  def enum_to_options(enum)
    Hash[enum.map { |item| [enum_to_human(item[0]), item[0]] }]
  end

  def send_csv_data(csv_data, filename)
    send_data csv_data.encode('gb2312', :invalid => :replace, :undef => :replace, :replace => '?'),
              :type => 'text/csv; charset=iso-8859-1; header=present',
              :disposition => "attachment; filename=#{filename}.csv"
  end

  def icon_for(flash_type)
    {
        :success => '&#xe613;',
        :error => '&#xe614;',
        :alert => '&#xe618;',
        :notice => '&#xe616;'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def alert_class_for(flash_type)
    {
        :success => 'alert-success',
        :error => 'alert-danger',
        :alert => 'alert-warning',
        :notice => 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def ilink_to(text, path, options = {}) #带iconfont的lint_to
    icon_class = options[:icon]
    options.delete(:icon)
    link_to path, options do
      content_tag(:i, '', class: "fa fa-#{icon_class}") + content_tag(:span, " #{text}")
    end
  end

  def module_name #返回controller name (如果controller在目录中，则返回该目录名)
    controller_path.split('/')[0]
  end
end
