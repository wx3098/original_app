require 'rails_helper'

RSpec.describe 'ユーザー認証', type: :system do
  describe '新規登録' do
    it 'ユーザーの新規登録ができること' do
      visit new_hospital_registration_path
      fill_in '名前', with: 'テストユーザー'
      fill_in 'メールアドレス', with: 'test@example.com'
      fill_in 'パスワード', with: 'password'
      fill_in 'パスワード（確認用）', with: 'password'
      click_button '登録する'

      expect(page).to have_content 'アカウント登録が完了しました。'
    end
  end

  describe 'ログイン' do
    let(:hospital) { create(:hospital) }

    it 'ユーザーがログインできること' do
      visit new_hospital_session_path
      fill_in 'メールアドレス', with: hospital.email
      fill_in 'パスワード', with: hospital.password
      click_button 'ログイン'

      expect(page).to have_content 'ログインしました。'
    end
  end

  describe 'ログアウト' do
    let(:hospital) { create(:hospital) }

    it 'ユーザーがログアウトできること' do
      sign_in user
      visit root_path
      click_link 'ログアウト'

      expect(page).to have_content 'ログアウトしました。'
    end
  end

  describe 'パスワードリセット' do
    let(:hospital) { create(:hospital) }

    it 'ユーザーがパスワードをリセットできること' do
      visit new_user_password_path
      fill_in 'メールアドレス', with: hospital.email
      click_button 'パスワード再設定用のメールを送信する'

      expect(page).to have_content 'パスワード再設定用のメールを送信しました。'
    end
  end

  describe 'アカウントロックアウト' do
    let(:hospital) { create(:hospital) }

    it 'ログインに失敗した場合、アカウントがロックアウトされること' do
      10.times do
        visit new_user_session_path
        fill_in 'メールアドレス', with: user.email
        fill_in 'パスワード', with: 'wrong_password'
        click_button 'ログイン'

        expect(page).to have_content 'メールアドレスまたはパスワードが違います。'
      end
    end
  end
end