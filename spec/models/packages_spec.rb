#bundle exec rspec spec/models/packages_spec.rb
require 'rails_helper'

RSpec.describe 'システムの登録', type: :model do

  describe 'バリデーションのテスト' do

    context 'システム未入力の場合' do
      it 'バリデーション処理される' do
        package = Package.new(name: '' )
        expect(package).not_to be_valid
      end
    end

    context 'システム入力の入力オーバー(50)' do
      it 'バリデーション処理される' do
        package = Package.new(name: '123456789012345678901234567890123456789012345678901' )
        expect(package).not_to be_valid
      end
    end

  end

  describe '登録のテスト' do

    context '全て入力されたとき' do
      it '登録される' do
        package = Package.new(name: '確認' )
        expect(package).to be_valid
      end
    end

  end

end
