# bundle exec rspec spec/system/employee_spec.rb
require 'rails_helper'
RSpec.describe 'ユーザー関連', type: :system do


  describe 'ユーザーログインのテスト' do
    context 'ユーザーがログインした場合' do
      it 'ログインしてトップページが表示される' do
        #部署
        department = FactoryBot.create(:department1)
        #ログインユーザー
        employee = FactoryBot.create(:employee7, department: department)
        visit root_path
        click_link 'login'
        fill_in 'employee_email', with: 'admin1@gmail.com'
        fill_in 'employee_password', with: 'password'
        click_button 'login'
        expect(page).to have_content 'ログインしました'
      end

      it 'ログアウトを押してトップページに戻る' do
        #部署
        department = FactoryBot.create(:department1)
        #ログインユーザー
        employee = FactoryBot.create(:employee7, department: department)
        visit root_path
        click_link 'login'
        fill_in 'employee_email', with: 'admin1@gmail.com'
        fill_in 'employee_password', with: 'password'
        click_button 'login'
        click_link  'logout1'
        expect(page).to have_content 'ログアウトしました。'
      end

    end

    context 'ユーザーがログインに失敗した場合' do

      it 'メールを間違えてエラーを表示する' do
        #部署
        department = FactoryBot.create(:department1)
        #ログインユーザー
        employee = FactoryBot.create(:employee7, department: department)
        visit root_path
        click_link 'login'
        fill_in 'employee_email', with: 'user11@gmail.com'
        fill_in 'employee_password', with: 'password'
        click_button 'login'
        expect(page).to have_content 'メールアドレスまたはパスワードが違います。'
      end

      it 'パスワードを間違えてエラーを表示する' do
        #部署
        department = FactoryBot.create(:department1)
        #ログインユーザー
        employee = FactoryBot.create(:employee7, department: department)
        visit root_path
        click_link 'login'
        fill_in 'employee_email', with: 'admin1@gmail.com'
        fill_in 'employee_password', with: 'nopassword'
        click_button 'login'
        expect(page).to have_content 'メールアドレスまたはパスワードが違います。'
      end

    end

  end

end
