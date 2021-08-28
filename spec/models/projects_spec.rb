# bundle exec rspec spec/models/projects_spec.rb
require 'rails_helper'

RSpec.describe '顧客管理機能', type: :model do

  describe 'バリデーションのテスト' do
    context 'タイトル未入力の場合' do
      it 'バリデーションにひっかる' do
        project = Project.new(title: '', employee_id: '1' , customeruser_id: 1 , feature_id: 1 , department_id: 1 , package_id: 1 , customer_id: 1 , apoint_at: '2021-08-28' , deadline: '2021-08-29' , description: '失敗テスト' , priority: 1)
        expect(project).not_to be_valid
      end
    end

    context '部署未選択の場合' do
      it 'バリデーションにひっかる' do
        project = Project.new(title: 'エラーテスト', employee_id: '1' , customeruser_id: 1 , feature_id: 1 , department_id: '' , package_id: 1 , customer_id: 1 , apoint_at: '2021-08-28' , deadline: '2021-08-29' , description: '失敗テスト' , priority: 1)
        expect(project).not_to be_valid
      end
    end

    context '担当者未選択の場合' do
      it 'バリデーションにひっかる' do
        project = Project.new(title: 'エラーテスト', employee_id: '' , customeruser_id: 1 , feature_id: 1 , department_id: '1' , package_id: 1 , customer_id: 1 , apoint_at: '2021-08-28' , deadline: '2021-08-29' , description: '失敗テスト' , priority: 1)
        expect(project).not_to be_valid
      end
    end

    context '企業名未選択の場合' do
      it 'バリデーションにひっかる' do
        project = Project.new(title: 'エラーテスト', employee_id: '1' , customeruser_id: 1 , feature_id: 1 , department_id: '1' , package_id: 1 , customer_id: '' , apoint_at: '2021-08-28' , deadline: '2021-08-29' , description: '失敗テスト' , priority: 1)
        expect(project).not_to be_valid
      end
    end

    context '利用者未選択の場合' do
      it 'バリデーションにひっかる' do
        project = Project.new(title: 'エラーテスト', employee_id: '1' , customeruser_id: '' , feature_id: 1 , department_id: '1' , package_id: 1 , customer_id: '1' , apoint_at: '2021-08-28' , deadline: '2021-08-29' , description: '失敗テスト' , priority: 1)
        expect(project).not_to be_valid
      end
    end

    context 'システム未選択の場合' do
      it 'バリデーションにひっかる' do
        project = Project.new(title: 'エラーテスト', employee_id: '1' , customeruser_id: '1' , feature_id: 1 , department_id: '1' , package_id: '' , customer_id: '1' , apoint_at: '2021-08-28' , deadline: '2021-08-29' , description: '失敗テスト' , priority: 1)
        expect(project).not_to be_valid
      end
    end

    context '機能未選択の場合' do
      it 'バリデーションにひっかる' do
        project = Project.new(title: 'エラーテスト', employee_id: '1' , customeruser_id: '1' , feature_id: '' , department_id: '1' , package_id: '' , customer_id: '1' , apoint_at: '2021-08-28' , deadline: '2021-08-29' , description: '失敗テスト' , priority: 1)
        expect(project).not_to be_valid
      end
    end

    context '機能未選択の場合' do
      it 'バリデーションにひっかる' do
        project = Project.new(title: 'エラーテスト', employee_id: '1' , customeruser_id: '1' , feature_id: '' , department_id: '1' , package_id: '' , customer_id: '1' , apoint_at: '2021-08-28' , deadline: '2021-08-29' , description: '失敗テスト' , priority: 1)
        expect(project).not_to be_valid
      end
    end

    context '面談日がないの場合' do
      it 'バリデーションにひっかる' do
        project = Project.new(title: 'エラーテスト', employee_id: '1' , customeruser_id: '1' , feature_id: '1' , department_id: '1' , package_id: '1' , customer_id: '1' , apoint_at: '' , deadline: '2021-08-29' , description: '失敗テスト' , priority: 1)
        expect(project).not_to be_valid
      end
    end

    context '面談日と期日が逆の場合' do
      it 'バリデーションにひっかる' do
        project = Project.new(title: 'エラーテスト', employee_id: '1' , customeruser_id: '1' , feature_id: '1' , department_id: '1' , package_id: '1' , customer_id: '1' , apoint_at: '2021-08-29' , deadline: '2021-08-28' , description: '失敗テスト' , priority: 1)
        expect(project).not_to be_valid
      end
    end

    context '内容がない場合' do
      it 'バリデーションにひっかる' do
        project = Project.new(title: 'エラーテスト', employee_id: '1' , customeruser_id: '1' , feature_id: '1' , department_id: '1' , package_id: '1' , customer_id: '1' , apoint_at: '2021-08-29' , deadline: '2021-08-28' , description: '' , priority: 1)
        expect(project).not_to be_valid
      end
    end

    context '内容の文字数が超えた時(400)' do
      it 'バリデーションにひっかる' do
        project = Project.new(title: 'エラーテスト', employee_id: '1' , customeruser_id: '1' , feature_id: '1' , department_id: '1' , package_id: '1' , customer_id: '1' , apoint_at: '2021-08-29' , deadline: '2021-08-28' , description: '12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901' , priority: 1)
        expect(project).not_to be_valid
      end
    end

    context '所属部署とユーザーの部署が異なる場合' do
      it 'バリデーションにひっかる' do
        #部署
        department1 = FactoryBot.create(:department1)
        department2 = FactoryBot.create(:department2)
        #ログインユーザー
        employee1 = FactoryBot.create(:employee3, department: department1)
        employee2 = FactoryBot.create(:employee4, department: department2)

        project = Project.new(title: 'エラーテスト', employee_id: '2' , customeruser_id: '1' , feature_id: '1' , department_id: '1' , package_id: '1' , customer_id: '1' , apoint_at: '2021-08-29' , deadline: '2021-08-28' , description: '失敗テスト' , priority: 1)
        expect(project).not_to be_valid
      end
    end

    context '会社と利用者の会社が異なる場合' do
      it 'バリデーションにひっかる' do
        #会社
        customer1 = FactoryBot.create(:customer1)
        customer2 = FactoryBot.create(:customer2)
        #利用者
        customeruser1 = FactoryBot.create(:customeruser1, customer: customer1)
        customeruser2 = FactoryBot.create(:customeruser2, customer: customer2)

        project = Project.new(title: 'エラーテスト', employee_id: '1' , customeruser_id: '2' , feature_id: '1' , department_id: '1' , package_id: '1' , customer_id: '1' , apoint_at: '2021-08-29' , deadline: '2021-08-28' , description: '失敗テスト' , priority: 1)
        expect(project).not_to be_valid
      end
    end

    context 'システムと機能が納められたシステムが異なる場合' do
      it 'バリデーションにひっかる' do
        #パッケージ
        package1 = FactoryBot.create(:package1)
        package2 = FactoryBot.create(:package2)
        #機能
        feature1 = FactoryBot.create(:feature1, package: package1)
        feature2 = FactoryBot.create(:feature1, package: package2)

        project = Project.new(title: 'エラーテスト', employee_id: '1' , customeruser_id: '2' , feature_id: '2' , department_id: '1' , package_id: '1' , customer_id: '1' , apoint_at: '2021-08-29' , deadline: '2021-08-28' , description: '失敗テスト' , priority: 1)
        expect(project).not_to be_valid
      end
    end

  end

end
