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

puts __FILE__

puts "BEGINNING"
users = User.all.select(:username, :full_name, :id)

100.times.each do |t|
  puts "CREATE TIME SHEET AT INDEX: #{t} / 100"

  requester = users.sample
  confirmer = users.sample

  request_jp = RequestJpMoney.new({
    requested_user_id: requester.try(:id),
    confirmed_user_id: confirmer.try(:id),
    requested_user_name: requester.try(:username),
    confirmed_user_name: confirmer.try(:username),
    money_jp: Faker::Number.number(digits: 5),
    rate: Faker::Number.number(digits: 1),
    money_vn: Faker::Number.number(digits: 8),
    status: RequestJpMoney.statuses.keys.sample,
    reason: Faker::Quote.matz,
    note: Faker::Quote.matz,
  })

  puts "CREATE REQUEST JP MONEY SUCCESS #{request_jp.try(:id)}" if request_jp.save
end

puts "FINISHED"