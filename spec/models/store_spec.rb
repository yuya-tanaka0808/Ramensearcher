require 'rails_helper'

RSpec.describe Store, type: :model do
  describe '店舗登録機能', type: :model do
    describe'バリデーションのテスト' do
      context 'バリデーション項目全てに入力されている場合' do
        it '店舗登録される'
        store = Store.new(name: 'store', address:'address',line_name:'中央線',station:'中野駅')
        expect(store).to be_valid
      end
      context '店名が空の場合' do
        it 'バリデーションにひっかかる' do
          store = Store.new(name: '', address:'失敗テスト',line_name:'中央線',station:'中野駅')
          expect(store).not_to be_valid
        end
      end
      context '住所が空の場合' do
        it 'バリデーションにひっかかる' do
          store = Store.new(name: '店', address:'',line_name:'中央線',station:'中野駅')
          expect(store).not_to be_valid
        end
      end
      context '路線が空の場合' do
        it 'バリデーションにひっかかる' do
          store = Store.new(name: '店', address:'失敗テスト',line_name:'',station:'中野駅')
          expect(store).not_to be_valid
        end
      end
      context '駅が空の場合' do
        it 'バリデーションにひっかかる' do
          store = Store.new(name: '店', address:'失敗テスト',line_name:'中央線',station:'')
          expect(store).not_to be_valid
        end
      end
    end
  end
  before do
    store = Store.new(name: '店', address:'失敗テスト',line_name:'中央線',station:'中野駅')
    user = User.new(name: 'tanaka', email:'tanaka@example.com',encrypted_password:'password')
  end
  describe '営業時間登録機能' do
    context '営業開始時間が空' do
      it 'バリデーションにひっかかる' do
        opening = Opening.new(open_hour: '', last_order: '19:00', day_week: '月火水木金土', weeks: '12345', store_id: 'store.id' )
        expect(opening).not_to be_valid
      end
    end
    context '営業終了時間が空' do
      it 'バリデーションにひっかかる' do
        opening = Opening.new(open_hour: '10:00', last_order: '', day_week: '月火水木金土', weeks: '12345', store_id: 'store.id' )
        expect(opening).not_to be_valid
      end
    end
    context '曜日が不正な値' do
      it 'バリデーションにひっかかる' do
        opening = Opening.new(open_hour: '10:00', last_order: '19:00', day_week: 'あいうえお', weeks: '12345', store_id: 'store.id' )
        expect(opening).not_to be_valid
      end
    end
    context '曜日が空' do
      it 'バリデーションにひっかかる' do
        opening = Opening.new(open_hour: '10:00', last_order: '19:00', day_week: '', weeks: '12345', store_id: 'store.id' )
        expect(opening).not_to be_valid
      end
    end
    context '週が空' do
      it 'バリデーションにひっかかる' do
        opening = Opening.new(open_hour: '10:00', last_order: '19:00', day_week: '月火水木金土', weeks: '', store_id: 'store.id' )
        expect(opening).not_to be_valid
      end
    end
    context '週が不正な値' do
      it 'バリデーションにひっかかる' do
        opening = Opening.new(open_hour: '10:00', last_order: '19:00', day_week: '月火水木金土', weeks: 'aaa', store_id: 'store.id' )
        expect(opening).not_to be_valid
      end
    end
  end
  describe 'メニュー登録機能' do
    context 'メニュー名が空' do
      it 'バリデーションにひっかかる' do
        menu = Menu.new(name: '', price:'850', taste: '味噌',store_id: 'store.id')
        expect(menu).not_to be_valid
      end
    end
    context '価格が空' do
      it 'バリデーションにひっかかる' do
        menu = Menu.new(name: '味噌ラーメン', price:'', taste: '味噌')
        expect(menu).not_to be_valid
      end
    end
    context '味が空' do
      it 'バリデーションにひっかかる' do
        menu = Menu.new(name: '味噌ラーメン', price:'850', taste: '')
        expect(menu).not_to be_valid
      end
    end
  end
  describe '画像登録機能' do
    context 'イメージが空' do
      it 'バリデーションにひっかかる' do
        image = Image.new(image: '',store_id: 'store.id')
        expect(image).not_to be_valid
      end
    end
  end
  describe 'レビュー登録機能' do
    context '評価が空' do
      it 'バリデーションにひっかかる' do
        review = Review.new(rating: '',comment: 'とてもおいしい', store_id: 'store.id', user_id: 'user.id')
        expect(review).not_to be_valid
      end
    end
    context '評価が5より上' do
      it 'バリデーションにひっかかる' do
        review = Review.new(rating: '10',comment: 'とてもおいしい', store_id: 'store.id', user_id: 'user.id')
        expect(review).not_to be_valid
      end
    end
    context '評価が0' do
      it 'バリデーションにひっかかる' do
        review = Review.new(rating: '0',comment: 'とてもおいしい', store_id: 'store.id', user_id: 'user.id')
        expect(review).not_to be_valid
      end
    end
    context 'コメントが空' do
      it 'バリデーションにひっかかる' do
        review = Review.new(rating: '5',comment: '', store_id: 'store.id', user_id: 'user.id')
        expect(review).not_to be_valid
      end
    end
  end
end
