# == Schema Information
#
# Table name: bills
#
#  id                 :bigint           not null, primary key
#  customer_id        :bigint           default(0), not null
#  product_id         :bigint           default(0), not null
#  product_name       :string(255)      not null
#  link               :string(255)
#  phone              :string(255)
#  account_ya         :string(255)      not null
#  date_order         :datetime         not null
#  username           :string(255)      not null
#  full_name          :string(255)
#  amount             :float(24)        default(0.0), not null
#  price              :float(24)        default(0.0), not null
#  price_transport_jp :float(24)        default(0.0), not null
#  tax_jp             :float(24)        default(0.0), not null
#  rate               :float(24)        default(0.0)
#  price_buy          :float(24)        default(0.0), not null
#  weight             :float(24)        default(0.0), not null
#  price_transport_vn :float(24)        default(0.0), not null
#  status             :integer          default("waiting"), not null
#  sub_fee            :float(24)        default(0.0), not null
#  number_tracking    :integer          default(0)
#  term               :integer          default(0)
#  delivery_time      :datetime
#  paid_money         :float(24)        default(0.0), not null
#  type_paid          :integer          default("banking"), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  deleted_at         :datetime
#

puts __FILE__

puts "BEGINNING"

users = User.all.select(:id, :full_name, :username, :phone)
customers = Customer.all.select(:id, :full_name, :phone)
products = Product.all.select(:id, :name)

100.times.each do |t|
  puts "CREATE TIME SHEET AT INDEX: #{t} / 100"

  user = users.sample
  customer = customers.sample
  product = products.sample

  bill = Bill.new({
    customer_id: customer.try(:id),
    product_id: product.try(:id),
    product_name: product.try(:name),
    link: 'https://loremflickr.com/300/300',
    phone: customer.try(:phone),
    account_ya: user.try(:phone),
    date_order: Time.zone.now,
    username: user.try(:username),
    full_name: customer.try(:full_name),
    amount: Faker::Number.number(digits: 8),
    price: Faker::Number.number(digits: 8),
    price_transport_jp: Faker::Number.number(digits: 5),
    tax_jp: Faker::Number.number(digits: 2),
    rate: Faker::Number.number(digits: 1),
    price_buy: Faker::Number.number(digits: 8),
    weight: Faker::Number.number(digits: 1),
    price_transport_vn: Faker::Number.number(digits: 8),
    status: Bill.statuses.keys.sample,
    sub_fee: Faker::Number.number(digits: 5),
    number_tracking: Faker::Number.number(digits: 5),
    term: Faker::Number.number(digits: 5),
    delivery_time: Time.zone.now,
    paid_money: Faker::Number.number(digits: 5),
    type_paid: Bill.type_paids.keys.sample,
  })

  puts "CREATE BILL SUCCESS #{bill.try(:id)}" if bill.save
end

puts "FINISHED"