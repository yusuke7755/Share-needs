# bundle exec rspec spec/system/customerusers_spec.rb
require 'rails_helper'

RSpec.describe "取引先の顧客登録", type: :system do

  context '顧客登録の処理' do

    it '新規登録を行う' do

      #ログインユーザー
      FactoryBot.create(:employee1)
      #企業
      FactoryBot.create(:customer)

      visit root_path
      click_link 'login'
      fill_in 'employee_email', with: 'user1@gmail.com'
      fill_in 'employee_password', with: 'password'
      click_button 'login'
      #ユーザー登録に移動
      click_button '顧客登録'
      #新規登録に移動
      click_button '新規登録'
      #リストから選択
      select "中川コンツェルン", from: "customeruser_customer_id"
      fill_in 'customeruser_department', with: '総務部'
      fill_in 'customeruser_name', with: '山田太郎'
      fill_in 'customeruser_email', with: 'abcde@email.com'
      fill_in 'customeruser_tel', with: '33-3333-3333'
      fill_in 'customeruser_meta', with: 'Rspecテスト'
      click_button '登録'
      expect(page).to have_content 'ユーザ登録しました。'

    end

    it '顧客検索する' do

      #ログインユーザー
      FactoryBot.create(:employee1)
      #企業
      customer = FactoryBot.create(:customer)

      #利用者
      FactoryBot.create(:customeruser1, customer: customer)
      FactoryBot.create(:customeruser2, customer: customer)
      visit root_path
      click_link 'login'
      fill_in 'employee_email', with: 'user1@gmail.com'
      fill_in 'employee_password', with: 'password'
      click_button 'login'
      #ユーザー登録に移動
      click_button '顧客登録'
      #リストから選択
      select "中川コンツェルン", from: "search_customer_id"
      click_button '検索'
      expect(page).to have_content '山田太郎'

    end
  
    it '顧客編集する' do

      #ログインユーザー
      FactoryBot.create(:employee1)
      #企業
      # FactoryBot.create(:customer) 
      customer = FactoryBot.create(:customer)

      #利用者
      FactoryBot.create(:customeruser1, customer: customer)
      FactoryBot.create(:customeruser2, customer: customer)
      visit root_path
      click_link 'login'
      fill_in 'employee_email', with: 'user1@gmail.com'
      fill_in 'employee_password', with: 'password'
      click_button 'login'
      #ユーザー登録に移動
      click_button '顧客登録'
      #リストから選択
      select "中川コンツェルン", from: "search_customer_id"
      click_button '検索'
      # 特定のUserの編集画面に移動する
      all('tr td')[10].click_link 
      fill_in 'customeruser_department', with: '管理部'
      fill_in 'customeruser_name', with: '山田次郎'
      fill_in 'customeruser_email', with: 'fghij@email.com'
      fill_in 'customeruser_tel', with: '44-4444-4444'
      fill_in 'customeruser_meta', with: 'Rspecテスト2'
      click_on '更新'

    end

    it '顧客削除する' do

      #ログインユーザー
      FactoryBot.create(:employee1)
      #企業
      # FactoryBot.create(:customer) 
      customer = FactoryBot.create(:customer)

      #利用者
      FactoryBot.create(:customeruser1, customer: customer)
      FactoryBot.create(:customeruser2, customer: customer)
      visit root_path
      click_link 'login'
      fill_in 'employee_email', with: 'user1@gmail.com'
      fill_in 'employee_password', with: 'password'
      click_button 'login'
      #ユーザー登録に移動
      click_button '顧客登録'
      #リストから選択
      select "中川コンツェルン", from: "search_customer_id"
      click_button '検索'
      # 特定のUserの編集画面に移動する
      all('tr td')[11].click_link 
      # page.accept_confirm 'ユーザ情報が削除されます。よろしいですか？'
      page.accept_alert
       expect(page).to have_content  'ユーザを削除しました。'

    end

    it 'レポートに登録した顧客を削除出来ない' do
      #部署
      department1 = FactoryBot.create(:department1)

      #ログインユーザー
      employee1 = FactoryBot.create(:employee1, department: department1)

      #企業
      customer = FactoryBot.create(:customer)
      #利用者
      FactoryBot.create(:customeruser1, customer: customer)
      customeruser = FactoryBot.create(:customeruser, customer: customer)
      #パッケージ
      package = FactoryBot.create(:package1)
      #機能
      feature = FactoryBot.create(:feature1, package: package)
      #レポート
      FactoryBot.create(:project1, customer: customer , customeruser: customeruser, employee: employee1, department: department1, package: package, feature: feature )
      visit root_path
      click_link 'login'
      fill_in 'employee_email', with: 'user1@gmail.com'
      fill_in 'employee_password', with: 'password'
      click_button 'login'
      #ユーザー登録に移動
      click_button '顧客登録'
      #リストから選択
      select "中川コンツェルン", from: "search_customer_id"
      click_button '検索'
      # 特定のUserの編集画面に移動する
      all('tr td')[11].click_link 
      # page.accept_confirm 'ユーザ情報が削除されます。よろしいですか？'
      page.accept_alert
      expect(page).to have_content  'レポートに登録のあるユーザーは削除できません。'

    end

  end

end
