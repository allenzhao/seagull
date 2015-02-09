module Exportable
  extend ActiveSupport::Concern

  module ClassMethods
    def to_csv
      CSV.generate do |csv|
        csv << column_names
        all.each do |object|
          csv << object.attributes.values_at(*column_names)
        end
      end
    end
  end
end