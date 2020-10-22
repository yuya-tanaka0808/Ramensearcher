require 'rails_helper'

RSpec.describe Store, type: :model do
  describe '店舗登録機能', type: :model do
    describe'バリデーションのテスト' do
      context 'バリデーション項目全てに入力されている場合' do
        it '店舗登録される'
        store = Store.new(name: 'store', address:'address',line_name:'中央線',station:'中野駅')
      end
      context '店名が空の場合' do
        it 'バリデーションにひっかかる' do
          store = Store.new(name: '', address:'失敗テスト',line_name:'中央線',station:'中野駅')
          expect(task).not_to be_valid
        end
      end
      context '住所が空の場合' do
        it 'バリデーションにひっかかる' do
          store = Store.new(name: '店', address:'',line_name:'中央線',station:'中野駅')
          expect(task).not_to be_valid
        end
      end
      context '路線が空の場合' do
        it 'バリデーションにひっかかる' do
          store = Store.new(name: '店', address:'失敗テスト',line_name:'',station:'中野駅')
          expect(task).not_to be_valid
        end
      end
      context '駅が空の場合' do
        it 'バリデーションにひっかかる' do
          store = Store.new(name: '店', address:'失敗テスト',line_name:'中央線',station:'')
          expect(task).not_to be_valid
        end
      end
    end
  end
end
