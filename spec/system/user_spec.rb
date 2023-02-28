require 'rails_helper'
RSpec.describe 'ユーザー登録', type: :system do
  describe '新規作成機能' do
    context 'ユーザーを新規作成した場合' do
        it 'トップページ表示される' do
        visit home_path
        click_on 'ユーザー新規登録画面'
        fill_in 'user[name]', with: '高橋'
        fill_in 'user[email]', with: 'takha@hasi.com'
        fill_in 'user[password]', with: '987654'
        fill_in 'user[password_confirmation]', with: '987654'
        click_on '登録'
        visit tops_path
      end
    end
  context '登録している人の場合' do
    it 'ログイン画面にから入る' do
     visit home_path
       click_on 'ユーザーログイン'
        fill_in 'user[email]', with: 'takha@hasi.com'
        fill_in 'user[password]', with: '987654'
        click_on 'ログイン'
      visit tops_path
    end
  end
  
  context '管理者権限を持ったユーザーログインした場合' do
    it '管理者画面のリンクが出て管理者画面に行く' do
      FactoryBot.create(:third_user)
      visit user_session_path
      fill_in 'user[email]', with: 'admin@admin.com'
      fill_in 'user[password]', with: '123456'
      click_on 'ログイン'
      visit tops_path
      click_link '管理者画面'
      expect(page).to have_content 'サイト管理'
    end
   end
  end
end