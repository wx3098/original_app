require 'rails_helper'

RSpec.describe 'お気に入り登録', type: :system do
let!(:hospital1){FactoryBot.create(:hospital1)}
let!(:secound_user){FactoryBot.create(:secound_user)}

  context 'ユーザーが病院を検索した場合' do
    it '病院をお気に入りに登録出来る' do
      visit  new_hospital_session_path
      fill_in 'hospital[email]', with: hospital1.email
      fill_in 'hospital[password]', with: hospital1.password
      click_on 'ログイン'
      visit medical_departments_path
      click_on '病院用ログアウト'
      visit home_path
      click_on 'ユーザーログイン'
      fill_in 'user[email]', with: secound_user.email
      fill_in 'user[password]', with: secound_user.password
      click_on 'ログイン'
      visit tops_path
      fill_in 'hospital[name]', with: hospital1.name
      click_on '検索'
      click_on 'お気に入り登録'
      sleep(5)
      expect(page).to have_content 'お気に入り解除'
    end
  end
end