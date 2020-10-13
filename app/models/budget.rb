# == Schema Information
#
# Table name: budgets
#
#  id                   :bigint           not null, primary key
#  user_id              :bigint           not null
#  full_name            :string(255)
#  username             :string(255)
#  amount_money_jp      :float(24)        default(0.0), not null
#  latest_rate          :float(24)        default(0.0)
#  amount_money_vn_used :float(24)        default(0.0), not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  deleted_at           :datetime
#
class Budget < ApplicationRecord
end
