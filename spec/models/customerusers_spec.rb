# bundle exec rspec spec/models/customerusers_spec.rb
require 'rails_helper'

RSpec.describe '顧客登録', type: :model do

  describe 'バリデーションのテスト' do
    context '会社未選択の場合' do
      it 'バリデーションにひっかる' do
        customeruser = Customeruser.new(customer_id: '', department: '失敗テスト' , name: '失敗テスト' , email: 'err@email.com', tel: '1234567890' , meta: '失敗テスト')
        expect(customeruser).not_to be_valid
      end
    end
    context '名前未記入の場合' do
      it 'バリデーションにひっかる' do
        customeruser = Customeruser.new(customer_id: 1, department: '失敗テスト' , name: '' , email: 'err@email.com', tel: '1234567890' , meta: '失敗テスト')
        expect(customeruser).not_to be_valid
      end
    end
    context '名前桁あふれの場合(50)' do
      it 'バリデーションにひっかる' do
        customeruser = Customeruser.new(customer_id: 1, department: '失敗テスト' , name: '12345678901234567890123456789012456789012345678901' , email: 'err@email.com', tel: '1234567890' , meta: '失敗テスト')
        expect(customeruser).not_to be_valid
      end
    end
    context 'Eメール未入力の場合' do
      it 'バリデーションにひっかる' do
        customeruser = Customeruser.new(customer_id: 1, department: '失敗テスト' , name: '失敗テスト' , email: '', tel: '1234567890' , meta: '失敗テスト')
        expect(customeruser).not_to be_valid
      end
    end
  end
  context 'Eメールではない場合' do
    it 'バリデーションにひっかる' do
      customeruser = Customeruser.new(customer_id: 1, department: '失敗テスト' , name: '失敗テスト' , email: 'aiueo', tel: '1234567890' , meta: '失敗テスト')
      expect(customeruser).not_to be_valid
    end
  end
  context 'Eメール入力の文字数超えの場合(100)' do
    it 'バリデーションにひっかる' do
      customeruser = Customeruser.new(customer_id: 1, department: '失敗テスト' , name: '失敗テスト' , email: '1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890@email.com', tel: '1234567890' , meta: '失敗テスト')
      expect(customeruser).not_to be_valid
    end
  end

  describe '登録のテスト' do
    context '全て入力されたとき' do
      it '登録される' do
        # 会社名 
        customer = FactoryBot.create(:customer)
        customeruser = Customeruser.new(customer_id: '1', department: '管理部' , name: 'テスト太郎' , email: 'pass@email.com', tel: '1234567890' , meta: '成功テスト')
        expect(customeruser).to be_valid
      end
    end
  end

end
