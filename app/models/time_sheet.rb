# == Schema Information
#
# Table name: time_sheets
#
#  id           :bigint           not null, primary key
#  username     :string           not null
#  full_name    :string
#  phone        :string
#  time_in      :datetime
#  time_out     :datetime
#  working_time :float            default(0.0), not null
#  status       :integer          default("on_time"), not null
#  bonus        :string
#  reason       :text
#  action       :integer          default("consent"), not null
#  note         :text
#  money        :float            default(0.0), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  deleted_at   :datetime
#
class TimeSheet < ApplicationRecord
  acts_as_paranoid
  validates_presence_of :username, :working_time, :status, :action, :money

  enum status: {
    on_time: 0,
    late: 1,
    coming: 2,
    early: 3,
    leave: 4
  }

  enum action: {
    consent: 0,
    not_allow: 1,
    verbal_warn: 2
  }
end
