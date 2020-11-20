# == Schema Information
#
# Table name: customer_transactions
#
#  id          :bigint           not null, primary key
#  full_name   :string
#  phone       :string
#  account_ya  :string           not null
#  money       :float            default(0.0), not null
#  customer_id :bigint           not null
#  username    :string           not null
#  note        :text
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
