# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  name        :string(255)      not null
#  description :text(65535)
#  price       :float(24)        default(0.0), not null
#  note        :text(65535)
#  link        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  deleted_at  :datetime
#
class Product < ApplicationRecord
end
