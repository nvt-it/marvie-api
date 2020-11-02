# frozen_string_literal: true
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

puts __FILE__

puts "BEGINNING"

users = User.all

time_in = Time.zone.now.beginning_of_day + 8.hours
time_out = Time.zone.now.beginning_of_day + 17.hours

100.times.each do |t|
  puts "CREATE TIME SHEET AT INDEX: #{t} / 100"

  user = users.sample

  time_sheet = TimeSheet.new({
    username: user.try(:username),
    full_name: user.try(:full_name),
    phone: user.try(:phone),
    time_in: time_in,
    time_out: time_out,
    working_time: 8,
    status: 'on_time',
    money: Faker::Number.number(digits: 5),
    bonus: Faker::Number.number(digits: 2),
    reason: Faker::Quote.matz,
    note: Faker::Quote.matz,
    action: TimeSheet.actions.keys.sample,
    money: Faker::Number.number(digits: 5)
  })

  puts "CREATE TIME SHEET SUCCESS #{time_sheet.try(:id)}" if time_sheet.save
end

puts "FINISHED"