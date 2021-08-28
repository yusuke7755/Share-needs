require 'rails_helper'

RSpec.describe '顧客登録', type: :model do

  describe 'バリデーションのテスト' do
    context 'システム名未入力の場合' do
      it 'バリデーション処理される' do
        customeruser = Customeruser.new(name: '')
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
  end

end
