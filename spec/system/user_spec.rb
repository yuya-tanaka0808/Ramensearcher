require 'rails_helper'
RSpec.describe 'ユーザー管理機能', type: :system do

  let!(:user) { FactoryBot.create(:user) }
  let!(:admin_user) { FactoryBot.create(:admin_user) }

  describe '新規作成機能テスト' do
    context 'ユーザーを新規作成した場合' do
      it 'アカウントが登録できる' do
        visit root_path
        click_on '新規ユーザー登録'
        fill_in 'user_name', with: 'test_user'
        fill_in 'user_email', with: 'test@example.com'
        fill_in 'password', with: 'password'
        fill_in 'passwordconfirm', with: 'password'
        click_on 'アカウント登録'
        expect(page).to have_content 'アカウント登録が完了しました'
      end
    end
    context '既存のユーザーがログインした場合' do
      it 'ログインが出来る' do
        visit root_path
        click_on 'ログイン'
        fill_in 'user_email', with: 'user1@example.com'
        fill_in 'password', with: 'password'
        click_on 'Log in'
        expect(page).to have_content 'ログインしました。'
      end
    end
    context '管理者がログインした場合' do
      it '管理者画面を見れる' do
        visit root_path
        click_on 'ログイン'
        fill_in 'user_email', with: 'admin@example.com'
        fill_in 'password', with: 'password'
        click_on 'Log in'
        click_on '管理者'
        sleep 0.5
        expect(page).to have_content 'サイト管理'
        expect(page).to have_content 'ダッシュボード'
      end
    end
  end
end