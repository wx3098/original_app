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
        hospital1 = Hospital.create(name: '病院A', email: 'hospital1@example.com', password: 'password1')
        hospital2 = Hospital.create(name: '病院B', email: 'hospital2@example.com', password: 'password2')
        hospital1.save!
        hospital2.save!
        department1 = hospital1.medical_departments.create(name: '皮膚科')
        department2 = hospital2.medical_departments.create(name: '皮膚科')
        expect(department2).to be_valid
      end
    end
  end
end