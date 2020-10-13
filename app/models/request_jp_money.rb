# == Schema Information
#
# Table name: request_jp_moneys
#
#  id                  :bigint           not null, primary key
#  requested_user_id   :bigint           not null
#  confirmed_user_id   :bigint
#  requested_user_name :string(255)
#  confirmed_user_name :string(255)
#  money_jp            :float(24)        default(0.0), not null
#  rate                :float(24)        default(0.0)
#  money_vn            :float(24)        default(0.0), not null
#  status              :integer          default("waiting"), not null
#  reason              :text(65535)
#  note                :text(65535)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  deleted_at          :datetime
#
class RequestJpMoney < ApplicationRecord
  enum status: {
    waiting: 0,
    confirmed: 1,
    success: 2,
    cancelled: 3,
    rejected: 4
  }
end
