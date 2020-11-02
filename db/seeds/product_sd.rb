# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  name        :string(255)      not null
#  description :text(65535)
#  price       :float(24)        default(0.0), not null
#  note        :text(65535)
#  link        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  deleted_at  :datetime
#

puts __FILE__

puts "BEGINNING"

100.times.each do |t|
  puts "CREATE TIME SHEET AT INDEX: #{t} / 100"

  product = Product.new({
    name: Faker::Name.name,
    description: Faker::Quote.matz,
    price: Faker::Number.number(digits: 8),
    note: Faker::Quote.matz,
    link: 'https://loremflickr.com/300/300'
  })

  puts "CREATE PRODUCT SUCCESS #{product.try(:id)}" if product.save
end

puts "FINISHED"