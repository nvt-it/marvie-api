# == Schema Information
#
# Table name: announcements
#
#  id         :bigint           not null, primary key
#  message    :text(65535)      not null
#  date       :datetime
#  username   :string(255)      not null
#  role       :integer          default("guest"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#

puts __FILE__

puts "BEGINNING"
users = User.all

100.times.each do |t|
  puts "CREATE TIME SHEET AT INDEX: #{t} / 100"

  user = users.sample

  announcement = Announcement.new({
    username: user.try(:username),
    role: user.try(:role),
    date: Time.zone.now,
    message: Faker::Quote.matz,
  })

  puts "CREATE ANNOUNCEMENT SUCCESS #{announcement.try(:id)}" if announcement.save
end

puts "FINISHED"