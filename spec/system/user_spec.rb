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
 end