#bundle exec rspec spec/models/customer_spec.rb
require 'rails_helper'

RSpec.describe '会社登録', type: :model do

  describe '会社の登録エラー' do

    context '名称未記入の場合' do
      it 'バリデーションにひっかる' do
        customer = Customer.new( name: '' , address: 'エラーテスト', tel: '1234567890' , user_flg: 'false')
        expect(customer).not_to be_valid
      end
    end

    context '名称桁あふれの場合(50)' do
      it 'バリデーションにひっかる' do
        customer = Customer.new( name: '123456789012345678901234567890123456789012456789012345678901' , address: 'エラーテスト', tel: '1234567890' , user_flg: 'false')
        expect(customer).not_to be_valid
      end
    end

    context '住所未記入の場合' do
      it 'バリデーションにひっかる' do
        customer = Customer.new( name: 'エラーテスト' , address: '', tel: '1234567890' , user_flg: 'false')
        expect(customer).not_to be_valid
      end
    end

    context '住所桁あふれの場合(100)' do
      it 'バリデーションにひっかる' do
        customer = Customer.new( name: 'エラーテスト' , address: '12345678901234567890123456789012345678901245678901234567890123456789012345678901234567890123456789012456789012345678901', tel: '1234567890' , user_flg: 'false')
        expect(customer).not_to be_valid
      end
    end

    context '電話番号未記入の場合' do
      it 'バリデーションにひっかる' do
        customer = Customer.new( name: 'エラーテスト' , address: 'エラーテスト', tel: '' , user_flg: 'false')
        expect(customer).not_to be_valid
      end
    end

    context '電話番号桁あふれの場合(50)' do
      it 'バリデーションにひっかる' do
        customer = Customer.new( name: 'エラーテスト' , address: 'エラーテスト', tel: '123456789012345678901234567890123456789012345678901' , user_flg: 'false')
        expect(customer).not_to be_valid
      end
    end

    context 'ユーザーフラグ未記入の場合' do
      it 'バリデーションにひっかる' do
        customer = Customer.new( name: 'エラーテスト' , address: 'エラーテスト', tel: '12345678901' , user_flg: '')
        expect(customer).not_to be_valid
      end
    end

  end

  describe '登録のテスト' do

    context '全て入力されたとき' do
      it '登録される' do
        customer = Customer.new( name: '登録' , address: '登録できます', tel: '12345678901' , user_flg: 'true')
        expect(customer).to be_valid
      end
    end

  end

end
