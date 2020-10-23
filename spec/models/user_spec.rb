require 'rails_helper'

RSpec.describe Store, type: :model do
  describe 'ユーザー登録機能', type: :model do
    describe'バリデーションのテスト' do
      context 'メールアドレスが不正な場合' do
        it 'バリデーションにひっかかる' do
          user = User.new(name: 'tanaka', email:'aaa',encrypted_password:'password')
          expect(user).not_to be_valid
        end
      end
      context 'メールアドレスが空な場合' do
        it 'バリデーションに引っかかる' do
          user = User.new(name: 'tanaka', email:'',encrypted_password:'password')
          expect(user).not_to be_valid
        end
      end
      context 'パスワードが6文字以下の場合' do
        it 'バリデーションに引っかかる' do
          user = User.new(name: 'tanaka', email:'test@example.com',encrypted_password:'pass')
          expect(user).not_to be_valid
        end
      end
    end
  end
end
