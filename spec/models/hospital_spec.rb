require 'rails_helper'
RSpec.describe Hospital, type: :model do
  describe 'バリデーションのテスト' do
    context 'ユーザーの名前が空の場合' do
      it 'バリデーションにひっかる' do
        hospital = Hospital.new(name: '', email: 'test@dd.com', password: '9876543', password_confirmation: '9876543'  )
        expect(hospital).not_to be_valid
      end
    end
    context 'アドレスが未入力だとバリデーションがかかる' do
      it 'バリデーションメッセージが表示される' do
        hospital = Hospital.new(name:'hiij',email:'',password:'123456', password_confirmation:'123456')
        expect(hospital).not_to be_valid
      end
    end
    context 'パスワードが未入力だとバリデーションがかかる' do
      it 'バリデーションメッセージが表示される' do
        hospital = Hospital.new(name:'tihij',email:'abc123@ic.com',password:'', password_confirmation:'')
        expect(hospital).not_to be_valid
      end
    end
    context 'ユーザー情報が正しく入力される' do
      it 'バリデーションが通る' do
        hospital = Hospital.new(name:'hhh',email:'abc123@ic.com',password:'123456', password_confirmation:'123456')
        expect(hospital).to be_valid
      end
    end
    context '同じ病院名が存在する場合' do
      it 'バリデーションにひっかる' do
        hospital1 = Hospital.create(name: '病院名', email: 'test@example.com', password: 'password', password_confirmation: 'password')
        hospital2 = Hospital.new(name: '病院名', email: 'test2@example.com', password: 'password', password_confirmation: 'password')
        expect(hospital2).not_to be_valid
      end
    end
  end
end