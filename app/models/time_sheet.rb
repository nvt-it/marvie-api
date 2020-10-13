# == Schema Information
#
# Table name: time_sheets
#
#  id           :bigint           not null, primary key
#  username     :string(255)      not null
#  full_name    :string(255)
#  phone        :string(255)
#  time_in      :datetime
#  time_out     :datetime
#  working_time :float(24)        default(0.0), not null
#  status       :integer          default("on_time"), not null
#  bonus        :string(255)
#  reason       :text(65535)
#  action       :integer          default("consent"), not null
#  note         :text(65535)
#  money        :float(24)        default(0.0), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  deleted_at   :datetime
#
class TimeSheet < ApplicationRecord
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
