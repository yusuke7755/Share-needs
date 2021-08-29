#bundle exec rspec spec/models/departments_spec.rb
require 'rails_helper'

RSpec.describe '部署の登録', type: :model do

  describe 'バリデーションのテスト' do

    context '部署未入力の場合' do
      it 'バリデーション処理される' do
        department = Department.new(name: '' , web_flg:'false')
        expect(department).not_to be_valid
      end
    end

    context '部署入力の入力オーバー(50)' do
      it 'バリデーション処理される' do
        department = Department.new(name: '123456789012345678901234567890123456789012345678901' , web_flg:'false')
        expect(department).not_to be_valid
      end
    end

    context 'レポート作成フラグの設定なし' do
      it 'バリデーション処理される' do
        department = Department.new(name: 'エラーテスト' , web_flg:'')
        expect(department).not_to be_valid
      end
    end
  end

  describe '登録のテスト' do

    context '全て入力されたとき' do
      it '登録される' do
        department = Department.new(name: '成功テスト' , web_flg:'true')
        expect(department).to be_valid
      end
    end

  end

end