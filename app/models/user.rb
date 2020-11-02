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
class User < ApplicationRecord
  has_secure_password

  validates_presence_of :username, :role, :status, :password_digest

  has_many :request_jp_moneys, foreign_key: :requested_user_id, class_name: 'RequestJpMoney', inverse_of: :requested_user
  has_many :confirmed_jp_moneys, foreign_key: :confirmed_user_id, class_name: 'RequestJpMoney', inverse_of: :confirmed_user

  enum role: {
    guest: 0,
    sale: 1,
    cs: 2,
    stock: 3,
    accountant: 4,
    jp: 5,
    admin: 99
  }

  enum status: {
    deactive: 0,
    active: 1,
    ban: 2
  }
end
