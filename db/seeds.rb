# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Faker::Config.locale = 'vi'

User.delete_all
Product.delete_all
Customer.delete_all
Announcement.delete_all
Bill.delete_all
CustomerTransaction.delete_all
Budget.delete_all
RequestJpMoney.delete_all
TimeSheet.delete_all

load Rails.root.join('db', 'seeds', 'user_sd.rb')
load Rails.root.join('db', 'seeds', 'product_sd.rb')
load Rails.root.join('db', 'seeds', 'customer_sd.rb')
load Rails.root.join('db', 'seeds', 'announcement_sd.rb')
load Rails.root.join('db', 'seeds', 'bill_sd.rb')
load Rails.root.join('db', 'seeds', 'customer_transaction_sd.rb')
load Rails.root.join('db', 'seeds', 'budget_sd.rb')
load Rails.root.join('db', 'seeds', 'request_jp_money_sd.rb')
load Rails.root.join('db', 'seeds', 'time_sheet_sd.rb')