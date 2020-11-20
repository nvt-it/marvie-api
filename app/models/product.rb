# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  description :text
#  price       :float            default(0.0), not null
#  note        :text
#  link        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  deleted_at  :datetime
#
class Product < ApplicationRecord
  acts_as_paranoid
  validates_presence_of :name, :price
  
  has_many :bills, dependent: :destroy
end
