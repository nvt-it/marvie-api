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
class Announcement  < ApplicationRecord
  
  enum role: {
    guest: 0,
    sale: 1,
    cs: 2,
    stock: 3,
    accountant: 4,
    jp: 5,
    admin: 99
  }
end
