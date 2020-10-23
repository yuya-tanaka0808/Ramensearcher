FactoryBot.define do
  factory :store do
    name { 'ラーメン屋' }
    address { '東京都中野区中野' }
    line_name { '中央線' }
    station { '中野駅' }
    after(:build) do |store|
      store.opening = FactoryBot.create(:opening)
      store.menu = FactoryBot.create(:menu)
    end
  end
end
FactoryBot.define do
  factory :opening do
    open_hour { '10:00' }
    last_order { '22:00' }
    day_week { '月火水木金土' }
    weeks { '12345' }
  end
end
FactoryBot.define do
  factory :menu do
    name { '味噌ラーメン' }
    price { '850' }
    taste { '味噌' }
  end
end
