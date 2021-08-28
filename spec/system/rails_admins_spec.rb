# bundle exec rspec spec/system/rails_admins_spec.rb
require 'rails_helper'

RSpec.describe "RailsAdmins", type: :system do

  describe 'Rails-adminのテスト' do

    context 'Rails-adminの各処理の実行' do

      it '管理者でログインしてRails-admin画面へ移動' do
        #部署
        department = FactoryBot.create(:department1)
        #ログインユーザー
        employee = FactoryBot.create(:employee7, department: department)
        visit root_path
        click_link 'login'
        fill_in 'employee_email', with: 'admin1@gmail.com'
        fill_in 'employee_password', with: 'password'
        click_button 'login'
        click_button 'マスタ登録'
        expect(page).to have_content 'サイト管理'
      end

    end

  end

end
