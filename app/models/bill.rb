# == Schema Information
#
# Table name: bills
#
#  id                 :bigint           not null, primary key
#  customer_id        :bigint           default(0), not null
#  product_id         :bigint           default(0), not null
#  product_name       :string(255)      not null
#  link               :string(255)
#  phone              :string(255)
#  account_ya         :string(255)      not null
#  date_order         :datetime         not null
#  username           :string(255)      not null
#  full_name          :string(255)
#  amount             :float(24)        default(0.0), not null
#  price              :float(24)        default(0.0), not null
#  price_transport_jp :float(24)        default(0.0), not null
#  tax_jp             :float(24)        default(0.0), not null
#  rate               :float(24)        default(0.0)
#  price_buy          :float(24)        default(0.0), not null
#  weight             :float(24)        default(0.0), not null
#  price_transport_vn :float(24)        default(0.0), not null
#  status             :integer          default("waiting"), not null
#  sub_fee            :float(24)        default(0.0), not null
#  number_tracking    :integer          default(0)
#  term               :integer          default(0)
#  delivery_time      :datetime
#  paid_money         :float(24)        default(0.0), not null
#  type_paid          :integer          default("banking"), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  deleted_at         :datetime
#
class Bill < ApplicationRecord
  validates_presence_of :customer_id, :product_id, :account_ya, :date_order, :username, :amount, :price, :price_transport_jp, :tax_jp, :price_buy, :weight, :price_transport_vn, :status, :sub_fee, :paid_money, :type_paid

  belongs_to :customer
  belongs_to :product

  enum status: {
    waiting: 0,
    confirmed: 1,
    prepared: 2,
    transported: 3,
    checked: 4,
    informed: 5,
    ready_delivery: 6,
    success: 7
  }

  enum type_paid: {
    banking: 0,
    ship_cod: 1
  }
end
