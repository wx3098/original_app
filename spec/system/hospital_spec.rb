require 'rails_helper'

RSpec.describe '病院ログイン', type: :system do
  let!(:hospital1){FactoryBot.create(:hospital1)}
  let!(:secound_user){FactoryBot.create(:secound_user)}

  describe '新規登録' do
    context '病院側の' do
      it '病院の新規登録ができること' do
        visit  new_hospital_registration_path
        fill_in 'hospital[name]', with: hospital1.name
        fill_in 'hospital[email]', with: hospital1.email
        fill_in 'hospital[password]', with: hospital1.password
        fill_in 'hospital[password_confirmation]', with: hospital1.password_confirmation
        click_on '登録'
        visit medical_departments_path
      end
    end
  end
  context '病院側の' do
    it 'ログインテスト' do
      visit  new_hospital_session_path
      fill_in 'hospital[email]', with: hospital1.email
      fill_in 'hospital[password]', with: hospital1.password
      click_on 'ログイン'   
      visit medical_departments_path
    end
  end
  
    context '予約済みの患者さんがいる場合' do
      it '診療科と時間を設定をする' do
        visit  new_hospital_session_path
        fill_in 'hospital[email]', with: hospital1.email
        fill_in 'hospital[password]', with: hospital1.password
        click_on 'ログイン'
        visit medical_departments_path
        click_on '新規診療科作成'
        visit new_hospitals_medical_department_path
        select '5分', from: 'medical_department[wait_time]'
        fill_in 'medical_department[name]', with:'小児科'
        click_on '登録する'
        visit medical_departments_path
      end
    end

    context '予約済みの患者さんがいる場合' do
      it '診療科から呼び出しが出来る' do
        #病院の登録、診療科の登録を行う。
        visit  new_hospital_session_path
        fill_in 'hospital[email]', with: hospital1.email
        fill_in 'hospital[password]', with: hospital1.password
        click_on 'ログイン'
        visit medical_departments_path
        click_on '新規診療科作成'
        visit new_hospitals_medical_department_path
        select '5分', from: 'medical_department[wait_time]'
        fill_in 'medical_department[name]', with:'小児科'
        click_on '登録する'
        visit medical_departments_path
        click_on '病院用ログアウト'

        # ユーザー側で受付を行う。
        visit home_path
        click_on 'ユーザーログイン'
        fill_in 'user[email]', with: secound_user.email
        fill_in 'user[password]', with: secound_user.password
        click_on 'ログイン'
        visit tops_path
        fill_in 'hospital[name]', with: hospital1.name
        click_on '検索'
        click_on '高橋病院'
        click_on '小児科'
        click_on '受付'
        visit mains_path
        click_on 'ユーザー用ログアウト'

        #病院側に入り呼び出しボタンを押す
        visit  new_hospital_session_path
        fill_in 'hospital[email]', with: hospital1.email
        fill_in 'hospital[password]', with: hospital1.password
        click_on 'ログイン'
        visit medical_departments_path
        click_on '呼び出しボタン'
        click_on '呼び出し'
        visit medical_departments_path
      end
    end
  end





 