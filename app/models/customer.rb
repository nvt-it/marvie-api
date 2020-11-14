# == Schema Information
#
# Table name: customers
#
#  id                 :bigint           not null, primary key
#  full_name          :string(255)
#  dob                :datetime
#  identify           :string(255)
#  phone              :string(255)
#  email              :string(255)
#  price_buy          :float(24)        default(0.0), not null
#  price_transport_vn :float(24)        default(0.0), not null
#  rate               :float(24)        default(0.0)
#  address            :string(255)
#  account_ya         :string(255)      not null
#  password_digest    :string(255)      default("0"), not null
#  money              :float(24)        default(0.0), not null
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
