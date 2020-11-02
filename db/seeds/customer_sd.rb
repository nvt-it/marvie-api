# == Schema Information
#
# Table name: customers
#
#  id                 :bigint           not null, primary key
#  full_name          :string(255)
#  dob                :datetime
#  identify           :string(255)
#  phone              :string(255)
#  email              :string(255)
#  price_buy          :float(24)        default(0.0), not null
#  price_transport_vn :float(24)        default(0.0), not null
#  rate               :float(24)        default(0.0)
#  address            :string(255)
#  account_ya         :string(255)      not null
#  password_digest    :string(255)      default("0"), not null
#  money              :float(24)        default(0.0), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  deleted_at         :datetime
#

puts __FILE__

puts "BEGINNING"

100.times.each do |t|
  puts "CREATE TIME SHEET AT INDEX: #{t} / 100"

  email = Faker::Internet.email

  customer = Customer.new({
    full_name: Faker::Name.name,
    identify: Faker::Number.number(digits: 10).to_s,
    password: 'cargo@2020',
    phone: Faker::PhoneNumber.phone_number,
    email: email,
    dob: Faker::Date.birthday(min_age: 18, max_age: 30),
    price_buy: Faker::Number.number(digits: 5),
    price_transport_vn: Faker::Number.number(digits: 8),
    rate: Faker::Number.number(digits: 1),
    address: Faker::Address.full_address,
    account_ya: email,
    money: Faker::Number.number(digits: 8)
  })

  puts "CREATE CUSTOMER SUCCESS #{customer.try(:id)}" if customer.save
end

puts "FINISHED"