class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def json_builder
    json = {}

    attributes.map do |k, v|
      json[k] = v.kind_of?(Time) ? k == 'dob' ? v.strftime('%d/%m/%Y') : v.strftime('%H:%M %d/%m/%Y') : v
    end

    json.except('password_digest')
  end
end
