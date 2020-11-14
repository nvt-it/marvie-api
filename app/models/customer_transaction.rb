# == Schema Information
#
# Table name: customer_transactions
#
#  id          :bigint           not null, primary key
#  full_name   :string(255)
#  phone       :string(255)
#  account_ya  :string(255)      not null
#  money       :float(24)        default(0.0), not null
#  customer_id :bigint           not null
#  username    :string(255)      not null
#  note        :text(65535)
#  date        :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  deleted_at  :datetime
#
class CustomerTransaction < ApplicationRecord
  acts_as_paranoid

  validates_presence_of :money, :customer_id, :account_ya, :username

  belongs_to :customer
end
