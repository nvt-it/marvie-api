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

puts __FILE__

puts "BEGINNING"
users = User.all.select(:username, :full_name, :id)

100.times.each do |t|
  puts "CREATE TIME SHEET AT INDEX: #{t} / 100"

  user = users.sample

  budget = Budget.new({
    username: user.try(:username),
    full_name: user.try(:full_name),
    user_id: user.try(:id),
    amount_money_jp:  Faker::Number.number(digits: 5),
    amount_money_vn_used:  Faker::Number.number(digits: 8),
    latest_rate: Faker::Number.number(digits: 1),
  })

  puts "CREATE BUDGET SUCCESS #{budget.try(:id)}" if budget.save
end

puts "FINISHED"