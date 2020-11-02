# == Schema Information
#
# Table name: customer_transactions
#
#  id          :bigint           not null, primary key
#  full_name   :string(255)
#  phone       :string(255)
#  account_ya  :string(255)      not null
#  money       :float(24)        default(0.0), not null
#  customer_id :bigint           not null
#  username    :string(255)      not null
#  note        :text(65535)
#  date        :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  deleted_at  :datetime
#

puts __FILE__

puts "BEGINNING"
users = User.all.select(:username, :full_name, :id)
customers = Customer.all.select(:full_name, :id)

100.times.each do |t|
  puts "CREATE TIME SHEET AT INDEX: #{t} / 100"

  user = users.sample
  customer = customers.sample

  customer_transaction = CustomerTransaction.new({
    username: user.try(:username),
    full_name: customer.try(:full_name),
    customer_id: customer.try(:id),
    account_ya:  user.try(:username),
    money:  Faker::Number.number(digits: 8),
    phone: customer.try(:phone),
    note: Faker::Quote.matz,
    date: Time.zone.now
  })

  puts "CREATE CUSTOMER TRANSACTION SUCCESS #{customer_transaction.try(:id)}" if customer_transaction.save
end

puts "FINISHED"