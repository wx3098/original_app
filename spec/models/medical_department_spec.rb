require 'rails_helper'
RSpec.describe MedicalDepartment, type: :model do
  describe 'バリデーションのテスト' do
    context '診療科が空の場合' do
      it 'バリデーションにひっかる' do
        department = MedicalDepartment.new(name: '' )
        expect(department).not_to be_valid
      end
    end
    context 'アドレスが未入力だとバリデーションがかかる' do
      it 'バリデーションメッセージが表示される' do
        department  = MedicalDepartment.new(name:'小児科')
        expect(department ).not_to be_valid
      end
    end
  end
end