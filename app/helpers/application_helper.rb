module ApplicationHelper

  def enum_to_human(enum)
    I18n.t(:"enum.#{enum}", default: enum.to_s.humanize) unless enum.blank?
  end

  def enum_to_options(enum)
    Hash[enum.map { |item| [enum_to_human(item[0]), item[0]] }]
  end

end
