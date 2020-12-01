# == Schema Information
#
# Table name: users
#
#  id           :bigint           not null, primary key
#  phone        :string           not null
#  email        :string
#  dob          :datetime
#  salary       :string
#  bonus        :string
#  identify     :string
#  uid          :string           not null
#  role         :integer          default("guest"), not null
#  login_time   :text
#  permission   :text
#  status       :integer          default("deactive"), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  deleted_at   :datetime
#  device_token :text
#  name         :string
#  avatar_url   :string
#  language     :string
#
require 'authorization'

class User < ApplicationRecord
  acts_as_paranoid

  validates_presence_of :uid, :role, :status, :phone
  validates :uid, uniqueness: true
  validates :phone, uniqueness: true
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

  class << self
    def find_or_new(uid)
      ::User.find_by(uid: uid) || ::User.new(uid: uid)
    end
  end

  def token
    ::Authorization.encode({ id: id })
  end
end
