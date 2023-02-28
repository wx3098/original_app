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
      click_on 'ログイン'   
      visit new_hospitals_medical_department_path
      expect(page).to have_content '診療科'
    end
  end



  
    context '病院からログインし' do
      it '診療科と時間を設定をする' do
        visit  new_hospital_session_path
        fill_in 'hospital[email]', with: hospital1.email
        fill_in 'hospital[password]', with: hospital1.password
        click_on 'ログイン'
        visit new_hospitals_medical_department_path
        fill_in 'medical_department[name]', with:'小児科'
        select '5分', from: 'wait_time'
        click_on '登録する'
        expect(page).to have_content '診療科一覧'
      end
    end
    context '病院からログインし' do
      it '時間に関係なく呼び出しが出来る' do
        visit  new_hospital_session_path
        fill_in 'hospital[email]', with: hospital1.email
        fill_in 'hospital[password]', with: hospital1.password
        click_on 'ログイン'
        visit new_hospitals_medical_department_path
        fill_in 'medical_department[name]', with:'小児科'
        select '5分', from: 'wait_time'
        click_on '登録する'
        visit medical_departments_path
        click_link '呼び出しボタン'
        expect(page).to have_content '診療科情報'
      end
    end
  end





