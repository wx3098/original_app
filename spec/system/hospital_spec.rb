require 'rails_helper'

RSpec.describe '病院ログイン', type: :system do
  let!(:hospital1){FactoryBot.create(:hospital1)}
  describe '新規登録' do
    context '病院' do
      it '病院の新規登録ができること' do
        visit  new_hospital_registration_path
        fill_in 'hospital[name]', with: '古谷総合病院'
        fill_in 'hospital[email]', with: 'furu@ya.com'
        fill_in 'hospital[password]', with: 'furu@ya.com'
        fill_in 'hospital[password_confirmation]', with: 'furu@ya.com'
        click_on '登録'
        visit new_hospitals_medical_department_path
        expect(page).to have_content '診療科'
      end
    end
  end
  context '病院側の' do
    it 'ログインテスト' do
      visit  new_hospital_session_path
      fill_in 'hospital[email]', with: hospital1.email
      fill_in 'hospital[password]', with: hospital1.password
      sleep(3)
      click_on 'ログイン'   
      visit new_hospitals_medical_department_path
      sleep(3)
      expect(page).to have_content '診療科'
    end
  end
  


  context '病院からログインし' do
    it '受付ボタンを押す' do
      click_on '病院用ログイン'
      visit  new_hospital_session_path
      fill_in 'hospital[email]', with: 'furu@ya.com'
      fill_in 'hospital[password]', with: 'furu@ya.com'
      click_on 'ログイン'
      visit medical_department_path
      expect(page).to have_content '呼び出しボタン'
      click_link '戻る'
      visit hospitals_medical_department_path
      click_link '呼び出しボタン'
      except(page).to have_content '診療科情報'
    end
  end
end



