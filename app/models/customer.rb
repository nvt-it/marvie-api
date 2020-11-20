# == Schema Information
#
# Table name: customers
#
#  id                 :bigint           not null, primary key
#  full_name          :string
#  dob                :datetime
#  identify           :string
#  phone              :string
#  email              :string
#  price_buy          :float            default(0.0), not null
#  price_transport_vn :float            default(0.0), not null
#  rate               :float            default(0.0)
#  address            :string
#  account_ya         :string           not null
#  password_digest    :string           default("0"), not null
#  money              :float            default(0.0), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  deleted_at         :datetime
#
class Customer < ApplicationRecord
  acts_as_paranoid
  has_secure_password

  validates_presence_of :price_buy, :price_transport_vn, :account_ya, :password_digest, :money

  has_many :customer_transactions, dependent: :destroy
  has_many :bills, dependent: :destroy
end
