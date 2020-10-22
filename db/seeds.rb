require 'csv'

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
    openings_attributes: [open_hour: row['open_hour1'],
                          last_order: row['last_order1'],
                          day_week: row['day_week1'],
                          weeks: row['weeks1'],
    ],
  )
end
User.create!(name: "admin",
             email: "admin@example.com",
             password: "password",
             admin: true
)
14.times do |n|
  User.create!(name: "number#{n}",
               email: "number#{n}@example.com",
               password: 'password',
               password_confirmation: 'password',
               )
end
5.times do |n|
Store.create!(name: "中野のstore#{n}",
              address: "東京都中野区中野#{n}丁目",
              line_name: "中央線",
              station: "中野駅",
              openings_attributes: [
                open_hour: "10:00",
                last_order: "22:00",
                day_week: "月火水木金土",
                weeks: "12345"
              ]
)
end
5.times do |n|
  Store.create!(name: "東中野のstore#{n}",
                address: "東京都中野区東中野#{n}丁目",
                line_name: "総武線",
                station: "東中野駅",
                openings_attributes: [
                  open_hour: "18:00",
                  last_order: "24:00",
                  day_week: "月水木金土日祝",
                  weeks: "12345"
                ]
  )
end


5.times do |n|
  Store.create!(name: "新宿のstore#{n}",
                address: "東京都新宿区新宿#{n}丁目",
                line_name: "中央線",
                station: "新宿駅",
                openings_attributes: [
                  open_hour: "11:30",
                  last_order: "22:00",
                  day_week: "月火水木金土",
                  weeks: "12345"
                ]
  )
end
5.times do |n|
  Store.create!(name: "西武池袋のstore#{n}",
                address: "東京都豊島区池袋#{n}丁目",
                line_name: "西武池袋線",
                station: "池袋駅",
                openings_attributes: [
                  open_hour: "17:30",
                  last_order: "22:00",
                  day_week: "火水木金土",
                  weeks: "12345"
                ]
  )
end

5.times do |n|
  Store.create!(name: "落合のstore#{n}",
                address: "東京都新宿区落合#{n}丁目",
                line_name: "東西線",
                station: "落合駅",
                openings_attributes: [
                  open_hour: "10:30",
                  last_order: "15:00",
                  day_week: "月火水木",
                  weeks: "12345"
                ]
  )
end

5.times do |n|
  Store.create!(name: "渋谷のstore#{n}",
                address: "東京都渋谷渋谷#{n}丁目",
                line_name: "井の頭線",
                station: "渋谷駅",
                openings_attributes: [
                  open_hour: "18:30",
                  last_order: "23:00",
                  day_week: "月火金土",
                  weeks: "12345"
                ]
  )
end

5.times do |n|
  Store.create!(name: "吉祥寺のstore#{n}",
                address: "東京都武蔵野市吉祥寺#{n}丁目",
                line_name: "井の頭線",
                station: "吉祥寺駅",
                openings_attributes: [
                  open_hour: "11:30",
                  last_order: "23:00",
                  day_week: "月火水木金祝",
                  weeks: "12345"
                ]
  )
end