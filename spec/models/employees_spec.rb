# bundle exec rspec spec/models/employees_spec.rb
require 'rails_helper'

RSpec.describe '社員登録', type: :model do

  describe 'バリデーションのテスト' do

    context '部署未選択の場合' do
      it 'バリデーションにひっかる' do
        employee = Employee.new(department_id: '' , name: '失敗テスト', encrypted_password: 'errorpass' , email: 'err@email.com' , position: 1 , admin: 'false')
        expect(employee).not_to be_valid
      end
    end

    context 'Eメール未入力の場合' do
      it 'バリデーションにひっかる' do
        employee = Employee.new(department_id: 1 , name: '失敗テスト', encrypted_password: 'errorpass' , email: '', position: 1 , admin: 'false')
        expect(employee).not_to be_valid
      end
    end

    context 'Eメールではない場合' do
      it 'バリデーションにひっかる' do
        employee = Employee.new(department_id: 1 , name: '失敗テスト', encrypted_password: 'errorpass' , email: 'メールアドレス', position: 1 , admin: 'false')
        expect(employee).not_to be_valid
      end
    end
  
    context 'Eメール入力の文字数超えの場合(50)' do
      it 'バリデーションにひっかる' do
        employee = Employee.new(department_id: 1 , name: '失敗テスト', encrypted_password: 'errorpass' , email: '12345678901234567890123456789012345678901234567890@email.com', position: 1 , admin: 'false')
        expect(employee).not_to be_valid
      end
    end

    context 'パスワード未入力の場合' do
      it 'バリデーションにひっかる' do
        employee = Employee.new(department_id: 1 , name: '失敗テスト', encrypted_password: '' , email: '', position: 1 , admin: 'false')
        expect(employee).not_to be_valid
      end
    end

    context 'パスワードの文字数超えの場合(6)' do
      it 'バリデーションにひっかる' do
        employee = Employee.new(department_id: 1 , name: '失敗テスト', encrypted_password: 'errorpass' , email: '12345678901234567890123456789012345678901234567890@email.com', position: 1 , admin: 'false')
        expect(employee).not_to be_valid
      end
    end

    context 'admin権限未入力の場合' do
      it 'バリデーションにひっかる' do
        employee = Employee.new(department_id: 1 , name: '失敗テスト', encrypted_password: 'errorpass' , email: 'err@email.com' , position: 1 , admin: '')
        expect(employee).not_to be_valid
      end
    end

  end

  describe '登録のテスト' do

    context '全て入力されたとき' do
      it '登録される' do
        # 会社名 
        employee = Employee.new(department_id: 1 , name: '成功テスト', encrypted_password: 'goodpassword' , email: 'good@email.com' , position: 1 , admin: 'true')
        expect(employee).not_to be_valid
      end
    end

  end

end