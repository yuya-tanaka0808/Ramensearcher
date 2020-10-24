require 'rails_helper'
RSpec.describe '店舗管理機能', type: :system do
  let!(:admin_user) { FactoryBot.create(:admin_user) }
  let!(:store) { FactoryBot.create(:store) }
  let!(:store1) { FactoryBot.create(:store1) }
  let!(:store2) { FactoryBot.create(:store2) }
  let!(:store3) { FactoryBot.create(:store3) }

  describe '店舗機能テスト' do

    before do
      visit root_path
      click_on 'ログイン'
      fill_in 'user_email', with: 'admin@example.com'
      fill_in 'password', with: 'password'
      click_on 'Log in'
    end

    context '店舗を新規作成した場合' do
      it '店舗登録が登録して一覧に表示される' do
        click_on '新規店舗登録'
        fill_in 'store_name', with: 'おみせ'
        fill_in 'store_address', with: 'じゅうしょ'
        fill_in 'store_line_name', with: '中央線'
        fill_in 'store_station', with: '新宿駅'
        click_on 'submit'
        expect(page).to have_content 'おみせ'
        expect(page).to have_content '行きたい時間帯'
      end
    end

    context '店舗詳細(店名)を押した場合' do
      it '店舗詳細に表示される' do
        visit root_path
        click_on '中野屋'
        expect(page).to have_content 'レビュー一覧'
      end
    end

    context 'お気に入りする場合' do
      it 'お気に入り登録される' do
        visit root_path
        click_on '中野屋'
        click_on 'お気に入りする'
        expect(page).to have_content 'お気に入り登録しました'
      end
      it 'お気に入り一覧を見れる' do
        visit root_path
        click_on '中野屋'
        click_on 'お気に入りする'
        click_on 'プロフィール'
        expect(page).to have_content 'お気に入り店舗一覧'
        expect(page).to have_content '中野屋'
      end
    end
    context 'お気に入り解除する場合' do
      it 'お気に入り解除される' do
        visit root_path
        click_on '中野屋'
        click_on 'お気に入りする'
        click_on 'お気に入り解除する'
        expect(page).to have_content 'お気に入り解除しました'
      end
    end
    context 'レビューする場合' do
      it 'レビューされる' do
        visit root_path
        click_on '中野屋'
        fill_in 'review_rating', with: '5'
        fill_in 'review_comment', with: '中野一おいしい'
        click_on 'submit'
        expect(page).to have_content '☆5.0'
        expect(page).to have_content '中野一おいしい'
      end
    end
    context '画像つきでレビューする場合' do
      it '画像が表示される' do
        visit root_path
        click_on '中野屋'
        fill_in 'review_rating', with: '5'
        fill_in 'review_comment', with: '中野一おいしい'
        attach_file('review_image', 'app/assets/images/yamatoki.jpg')
        click_on 'submit'
        expect(page).to have_selector "img[src$='yamatoki.jpg']"
      end
    end
    context '曜日時間検索した場合' do
      it '一致した曜日と時間の店のみ表示される' do
        visit root_path
        select '日', from: 'q_openings_day_week_cont'
        select '12', from: 'q_openings_open_hour_lteq_4i'
        select '00', from: 'q_openings_open_hour_lteq_5i'
        select '13', from: 'q_openings_last_order_gteq_4i'
        select '00', from: 'q_openings_last_order_gteq_5i'
        click_on '検索する'
        expect(page).to have_no_content '中野'
        expect(page).to have_no_content '高円寺'
        expect(page).to have_no_content '新宿'
        expect(page).to have_content '練馬'
      end
    end
  end
end