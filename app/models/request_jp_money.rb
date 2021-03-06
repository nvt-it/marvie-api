# == Schema Information
#
# Table name: request_jp_moneys
#
#  id                  :bigint           not null, primary key
#  requested_user_id   :bigint           not null
#  confirmed_user_id   :bigint
#  requested_user_name :string
#  confirmed_user_name :string
#  money_jp            :float            default(0.0), not null
#  rate                :float            default(0.0)
#  money_vn            :float            default(0.0), not null
#  status              :integer          default("waiting"), not null
#  reason              :text
#  note                :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  deleted_at          :datetime
#
class RequestJpMoney < ApplicationRecord
  acts_as_paranoid
  validates_presence_of :requested_user_id, :money_jp, :rate, :money_vn, :status

  belongs_to :requested_user, foreign_key: :requested_user_id, class_name: 'User', inverse_of: :request_jp_moneys
  belongs_to :confirmed_user, foreign_key: :confirmed_user_id, class_name: 'User', inverse_of: :confirmed_jp_moneys
  
  enum status: {
    waiting: 0,
    confirmed: 1,
    success: 2,
    cancelled: 3,
    rejected: 4
  }
end
