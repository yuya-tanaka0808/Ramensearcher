# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

# CSV.foreach('app/assets/csv/Tokyocities.csv', headers: true) do |row|
#   City.create!(
#     name: row['name']
#   )
# end
#
# CSV.foreach('/Users/yusyan/workspace/Ramen_searcher/app/assets/csv/public_holiday.csv', headers: true) do |row|
#   PublicHoliday.create!(
#     date: row['日付']
#   )
# end

CSV.foreach('/Users/yusyan/workspace/Ramen_searcher/app/assets/csv/stores_seed.csv', headers: true) do |row|
  Store.create!(
    name: row['name'],
    address: row['address'],
    contact: row['contact'],
    line_name: row['line_name'],
    station: row['station'],
    minutes_on_foot: row['minutes_on_foot'],
    link: row['link'],
    open_closed: row['open_closed'],
    regular_holiday: row['regular_holiday'],
    note: row['note'],
    latitude: row['latitude'],
    longitude: row['longitude'],
  )
end
