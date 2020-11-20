# == Schema Information
#
# Table name: budgets
#
#  id                   :bigint           not null, primary key
#  user_id              :bigint           not null
#  full_name            :string
#  username             :string
#  amount_money_jp      :float            default(0.0), not null
#  latest_rate          :float            default(0.0)
#  amount_money_vn_used :float            default(0.0), not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  deleted_at           :datetime
#
class Budget < ApplicationRecord
  acts_as_paranoid
  
  validates_presence_of :user_id, :full_name, :username, :amount_money_jp, :amount_money_vn_used

  belongs_to :user
end
