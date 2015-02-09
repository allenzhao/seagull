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
end
