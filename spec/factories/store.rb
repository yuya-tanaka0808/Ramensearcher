FactoryBot.define do
  factory :store do
    name { '中野屋' }
    address { '東京都中野区中野' }
    line_name { '中央線' }
    station { '中野駅' }
    after(:create) do |store|
      # store.opening = FactoryBot.
      create(:opening, store: store)
      # store.menu = FactoryBot.create(:menu)
      create(:menu, store: store)
    end
  end
  factory :store1, class: Store do
    name { '新宿屋' }
    address { '東京都新宿区新宿' }
    line_name { '中央線' }
    station { '新宿駅' }
    after(:create) do |store|
      create(:opening1, store: store)
      create(:menu, store: store)
    end
  end
  factory :store2, class: Store do
    name { '高円寺屋' }
    address { '東京都杉並区高円寺' }
    line_name { '中央線' }
    station { '高円寺駅' }
    after(:create) do |store|
      create(:opening2, store: store)
      create(:menu, store: store)
    end
  end

  factory :store3, class: Store do
    name { '練馬屋' }
    address { '東京都練馬区練馬' }
    line_name { '西武池袋線' }
    station { '練馬駅' }
    after(:create) do |store|
      create(:opening3, store: store)
      create(:menu, store: store)
    end
  end
end
FactoryBot.define do
  factory :opening do
    open_hour { '13:00' }
    last_order { '22:00' }
    day_week { '月火水木金土' }
    weeks { '12345' }
  end

  factory :opening1, class: Opening do
    open_hour { '11:00' }
    last_order { '15:00' }
    day_week { '火水木金土' }
    weeks { '12345' }
  end

  factory :opening2, class: Opening do
    open_hour { '11:30' }
    last_order { '21:00' }
    day_week { '月火木金土' }
    weeks { '12345' }
  end

end

FactoryBot.define do
  factory :opening3, class: Opening do
    open_hour { '10:00' }
    last_order { '16:00' }
    day_week { '水木金土日祝' }
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
