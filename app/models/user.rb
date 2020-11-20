# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  full_name       :string
#  password_digest :string           not null
#  phone           :string
#  email           :string
#  dob             :datetime
#  salary          :string
#  bonus           :string
#  identify        :string
#  uid             :string
#  role            :integer          default("guest"), not null
#  login_time      :text
#  permission      :text
#  status          :integer          default("deactive"), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  deleted_at      :datetime
#
require 'authorization'

class User < ApplicationRecord
  acts_as_paranoid
  has_secure_password

  validates_presence_of :username, :role, :status, :password_digest
  validates :username, uniqueness: true
  validates :identify, uniqueness: true

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

  def token
    ::Authorization.encode({ id: id })
  end
end
