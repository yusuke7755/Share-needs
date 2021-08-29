# bundle exec rspec spec/models/features_spec.rb
require 'rails_helper'

  RSpec.describe '機能登録', type: :model do

    describe 'バリデーションのテスト' do

      context '機能未入力の場合' do
        it 'バリデーション処理される' do
          feature = Feature.new(name: '', package_id: '1' )
          expect(feature).not_to be_valid
        end
      end

      context '機能入力の入力オーバー(50)' do
        it 'バリデーション処理される' do
          feature = Feature.new(name: '123456789012345678901234567890123456789012345678901', package_id: '1' )
          expect(feature).not_to be_valid
        end
      end

      context 'package_idとリレーションがない場合' do
        it 'バリデーション処理される' do
          feature = Feature.new(name: '確認', package_id: '' )
          expect(feature).not_to be_valid
        end
      end

    end

    describe '登録のテスト' do

      context '全て入力されたとき' do
        it '登録される' do
        #パッケージ
        package1 = FactoryBot.create(:package1)
          feature = Feature.new(name: '確認', package: package1 )
          expect(feature).to be_valid
        end
      end

    end

    
  end


