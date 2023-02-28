require 'rails_helper'

RSpec.describe '検索機能', type: :system do
context 'ユーザーからログインし' do
    it 'ログインし、病院検索をする場合' do
      # FactoryBot.create(:top, email: 'test@test.com', password:'9876544')
      visit home_path
      click_on 'ユーザーログイン'
      fill_in 'user[email]', with: 'test@test.com'
      fill_in 'user[password]', with: '9876544'
      click_on 'ログイン'
      visit tops_path
      FactoryBot.create(:hospital)
      fill_in '病院', with: 'サンプル'
      click_on '検索'
      expect(page).to have_content '病院検索'
    end
  end
  
end