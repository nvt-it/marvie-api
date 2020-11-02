# frozen_string_literal: true
# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string(255)      not null
#  full_name       :string(255)
#  password_digest :string(255)      not null
#  phone           :string(255)
#  email           :string(255)
#  dob             :datetime
#  salary          :string(255)
#  bonus           :string(255)
#  identify        :string(255)
#  role            :integer          default("guest"), not null
#  login_time      :text(65535)
#  permission      :text(65535)
#  status          :integer          default("deactive"), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  deleted_at      :datetime
#

puts __FILE__

puts "BEGINNING"

20.times.each do |t|
  puts "CREATE USER AT INDEX: #{t} / 20"

  username = Faker::Internet.email

  user = User.new({
    username: username,
    full_name: Faker::Name.name,
    password: 'cargo@2020',
    phone: Faker::PhoneNumber.phone_number,
    email: username,
    dob: Faker::Date.birthday(min_age: 18, max_age: 30),
    salary: Faker::Number.number(digits: 8),
    bonus: Faker::Number.number(digits: 7),
    identify: Faker::IDNumber.valid.gsub('-', ''),
    role: User.roles.keys.sample,
    status: User.statuses.keys.sample,
  })

  puts "CREATE USER SUCCESS #{user.try(:id)}" if user.save
end

puts "FINISHED"