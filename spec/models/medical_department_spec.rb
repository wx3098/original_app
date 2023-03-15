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
    context '同じ病院内で診療科名が重複する場合' do
      it 'バリデーションにひっかる' do
        hospital = Hospital.create(name: '病院A')
        department1 = MedicalDepartment.create(name: '小児科', hospital: hospital)
        department2 = MedicalDepartment.new(name: '小児科', hospital: hospital)
        expect(department2).not_to be_valid
      end
    end

    context '別の病院で同じ診療科名を使用する場合' do
      it 'バリデーションにひっかからない' do
        hospital1 = Hospital.create(name: '病院A')
        hospital2 = Hospital.create(name: '病院B')
        department1 = MedicalDepartment.create(name: '皮膚科', hospital: hospital1)
        department2 = MedicalDepartment.create(name: '皮膚科', hospital: hospital2)
        expect(department2.valid?).to eq(true)
      end
    end
  end
end