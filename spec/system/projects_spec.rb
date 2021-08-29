# bundle exec rspec spec/system/projects_spec.rb
require 'rails_helper'

RSpec.describe "レポート作成関連", type: :system do

  context 'レポート作成の処理' do

    it '新規登録を行う' do

      #部署
      department = FactoryBot.create(:department1)
      #ログインユーザー
      employee = FactoryBot.create(:employee2, department: department)
      #企業
      customer = FactoryBot.create(:customer1)
      #利用者
      customeruser = FactoryBot.create(:customeruser1, customer: customer)
      customeruser = FactoryBot.create(:customeruser2, customer: customer)
      #パッケージ
      package = FactoryBot.create(:package1)
      #機能
      feature = FactoryBot.create(:feature1, package: package)
      feature = FactoryBot.create(:feature2, package: package)
 

      visit root_path
      click_link 'login'
      fill_in 'employee_email', with: 'user2@gmail.com'
      fill_in 'employee_password', with: 'password'
      click_button 'login'
      #ユーザー登録に移動
      click_button 'レポート作成'
      #登録画面 
      fill_in 'project_title', with: 'テスト'
      select '営業部', from: "project_department_id"
      choose 'project_employee_id_1'
      select 'サカタインダストリィ', from: "project_customer_id"
      choose 'project_customeruser_id_2'
      select '販売管理システム', from: "project_package_id"
      choose 'project_feature_id_2'
      select '高', from: "project_priority"
      fill_in 'apoint_at', with: '002021-08-20'
      fill_in 'deadline', with: '002021-08-30'
      fill_in 'project_description', with: 'Rspecテスト'
      click_button 'レポート作成'
      expect(page).to have_content 'レポートが作成されました。'

    end

    it 'レポート検索：部署検索' do

      #部署
      department1 = FactoryBot.create(:department1)
      department2 = FactoryBot.create(:department2)
      #ログインユーザー
      employee1 = FactoryBot.create(:employee2, department: department1)
      employee2 = FactoryBot.create(:employee3, department: department2)
      #会社
      customer1 = FactoryBot.create(:customer1)
      customer2 = FactoryBot.create(:customer2)
      #利用者
      customeruser1 = FactoryBot.create(:customeruser1, customer: customer1)
      customeruser2 = FactoryBot.create(:customeruser2, customer: customer2)
      #パッケージ
      package = FactoryBot.create(:package1)
      #機能
      feature = FactoryBot.create(:feature1, package: package)

      #レポート
      FactoryBot.create(:project2, customer: customer1 , customeruser: customeruser1, department: department1, employee: employee1, package: package, feature: feature )
      FactoryBot.create(:project3, customer: customer2 , customeruser: customeruser2, department: department1, employee: employee1, package: package, feature: feature )
      FactoryBot.create(:project4, customer: customer2 , customeruser: customeruser2, department: department2, employee: employee2, package: package, feature: feature )

      visit root_path
      click_link 'login'
      fill_in 'employee_email', with: 'user2@gmail.com'
      fill_in 'employee_password', with: 'password'
      click_button 'login'
      #リストから選択
      select '営業部', from: 'search[department_id]'
      click_button '部署・会社 検索'
      expect(page).to have_content  '営業部'

    end

    it 'レポート検索：会社検索' do

      #部署
      department1 = FactoryBot.create(:department1)
      department2 = FactoryBot.create(:department2)
      #ログインユーザー
      employee1 = FactoryBot.create(:employee2, department: department1)
      employee2 = FactoryBot.create(:employee3, department: department2)
      #会社
      customer1 = FactoryBot.create(:customer1)
      customer2 = FactoryBot.create(:customer2)
      #利用者
      customeruser1 = FactoryBot.create(:customeruser1, customer: customer1)
      customeruser2 = FactoryBot.create(:customeruser2, customer: customer2)
      #パッケージ
      package = FactoryBot.create(:package1)
      #機能
      feature = FactoryBot.create(:feature1, package: package)

      #レポート
      FactoryBot.create(:project2, customer: customer1 , customeruser: customeruser1, department: department1, employee: employee1, package: package, feature: feature )
      FactoryBot.create(:project3, customer: customer2 , customeruser: customeruser2, department: department1, employee: employee1, package: package, feature: feature )
      FactoryBot.create(:project4, customer: customer2 , customeruser: customeruser2, department: department2, employee: employee2, package: package, feature: feature )

      visit root_path
      click_link 'login'
      fill_in 'employee_email', with: 'user2@gmail.com'
      fill_in 'employee_password', with: 'password'
      click_button 'login'
      #リストから選択
      select 'サカタインダストリィ', from: 'search[customer_id]'
      click_button '部署・会社 検索'
      expect(page).to have_content  'サカタインダストリィ'

    end

    it 'レポート検索：部署・会社 検索' do

      #部署
      department1 = FactoryBot.create(:department1)
      department2 = FactoryBot.create(:department2)
      #ログインユーザー
      employee1 = FactoryBot.create(:employee2, department: department1)
      employee2 = FactoryBot.create(:employee3, department: department2)
      #会社
      customer1 = FactoryBot.create(:customer1)
      customer2 = FactoryBot.create(:customer2)
      #利用者
      customeruser1 = FactoryBot.create(:customeruser1, customer: customer1)
      customeruser2 = FactoryBot.create(:customeruser2, customer: customer2)
      #パッケージ
      package = FactoryBot.create(:package1)
      #機能
      feature = FactoryBot.create(:feature1, package: package)

      #レポート
      FactoryBot.create(:project2, customer: customer1 , customeruser: customeruser1, department: department1, employee: employee1, package: package, feature: feature )
      FactoryBot.create(:project3, customer: customer2 , customeruser: customeruser2, department: department1, employee: employee1, package: package, feature: feature )
      FactoryBot.create(:project4, customer: customer2 , customeruser: customeruser2, department: department2, employee: employee2, package: package, feature: feature )

      visit root_path
      click_link 'login'
      fill_in 'employee_email', with: 'user2@gmail.com'
      fill_in 'employee_password', with: 'password'
      click_button 'login'
      #リストから選択
      select '営業部', from: 'search[department_id]'
      select '霧島重工株式会社', from: 'search[customer_id]'
      click_button '部署・会社 検索'
      expect(page).to have_content  '営業部'
      expect(page).to have_content  '霧島重工株式会社'

    end

    it 'レポート検索：タイトル・部分一致 検索(ransack)' do

      #部署
      department1 = FactoryBot.create(:department1)
      department2 = FactoryBot.create(:department2)
      #ログインユーザー
      employee1 = FactoryBot.create(:employee2, department: department1)
      employee2 = FactoryBot.create(:employee3, department: department2)
      #会社
      customer1 = FactoryBot.create(:customer1)
      customer2 = FactoryBot.create(:customer2)
      #利用者
      customeruser1 = FactoryBot.create(:customeruser1, customer: customer1)
      customeruser2 = FactoryBot.create(:customeruser2, customer: customer2)
      #パッケージ
      package = FactoryBot.create(:package1)
      #機能
      feature = FactoryBot.create(:feature1, package: package)

      #レポート
      FactoryBot.create(:project2, customer: customer1 , customeruser: customeruser1, department: department1, employee: employee1, package: package, feature: feature )
      FactoryBot.create(:project3, customer: customer2 , customeruser: customeruser2, department: department1, employee: employee1, package: package, feature: feature )
      FactoryBot.create(:project4, customer: customer2 , customeruser: customeruser2, department: department2, employee: employee2, package: package, feature: feature )

      visit root_path
      click_link 'login'
      fill_in 'employee_email', with: 'user2@gmail.com'
      fill_in 'employee_password', with: 'password'
      click_button 'login'
      #タイトル選択
      fill_in 'q[title_cont]', with: 'レポート'
      click_button 'タイトル 検索'
      expect(page).to have_content  'レポート検索'

    end

    it 'レポート詳細確認' do

      #部署
      department1 = FactoryBot.create(:department1)
      department2 = FactoryBot.create(:department2)
      #ログインユーザー
      employee1 = FactoryBot.create(:employee2, department: department1)
      employee2 = FactoryBot.create(:employee3, department: department2)
      #会社
      customer1 = FactoryBot.create(:customer1)
      customer2 = FactoryBot.create(:customer2)
      #利用者
      customeruser1 = FactoryBot.create(:customeruser1, customer: customer1)
      customeruser2 = FactoryBot.create(:customeruser2, customer: customer2)
      #パッケージ
      package = FactoryBot.create(:package1)
      #機能
      feature = FactoryBot.create(:feature1, package: package)

      #レポート
      FactoryBot.create(:project2, customer: customer1 , customeruser: customeruser1, department: department1, employee: employee1, package: package, feature: feature )
      FactoryBot.create(:project3, customer: customer2 , customeruser: customeruser2, department: department1, employee: employee1, package: package, feature: feature )
      FactoryBot.create(:project4, customer: customer2 , customeruser: customeruser2, department: department2, employee: employee2, package: package, feature: feature )

      visit root_path
      click_link 'login'
      fill_in 'employee_email', with: 'user2@gmail.com'
      fill_in 'employee_password', with: 'password'
      click_button 'login'
      #詳細ボタン確認
       all('tr td')[6].click_link 
       expect(page).to have_content  'レポート検索'
    end

    it 'レポート編集する' do

      #部署
      department1 = FactoryBot.create(:department1)
      department2 = FactoryBot.create(:department2)
      #ログインユーザー
      employee2 = FactoryBot.create(:employee2, department: department1)
      employee3 = FactoryBot.create(:employee3, department: department2)
      #会社
      customer1 = FactoryBot.create(:customer1)
      customer2 = FactoryBot.create(:customer2)
      #利用者
      customeruser1 = FactoryBot.create(:customeruser1, customer: customer1)
      customeruser2 = FactoryBot.create(:customeruser2, customer: customer2)
      #パッケージ
      package = FactoryBot.create(:package1)
      #機能
      feature = FactoryBot.create(:feature1, package: package)

      #レポート
      FactoryBot.create(:project2, customer: customer1 , customeruser: customeruser1, department: department1, employee: employee2, package: package, feature: feature )
      FactoryBot.create(:project3, customer: customer2 , customeruser: customeruser2, department: department1, employee: employee2, package: package, feature: feature )
      FactoryBot.create(:project4, customer: customer2 , customeruser: customeruser2, department: department2, employee: employee3, package: package, feature: feature )

      visit root_path
      click_link 'login'
      fill_in 'employee_email', with: 'user2@gmail.com'
      fill_in 'employee_password', with: 'password'
      click_button 'login'
      #詳細ボタン確認
      all('tr td')[6].click_link 
      expect(page).to have_content  'レポート検索'
      click_button '編集'
      select '営業部', from: "project_department_id"
      select '中', from: "project_priority"
      fill_in 'apoint_at', with: '002021-08-25'
      fill_in 'deadline', with: '002021-08-29'
      fill_in 'project_description', with: 'Rspecテスト2'
      click_button 'レポート編集'
      expect(page).to have_content 'レポートが編集されました。'

    end

    it 'レポート削除する' do

      #部署
      department1 = FactoryBot.create(:department1)
      department2 = FactoryBot.create(:department2)
      #ログインユーザー
      employee2 = FactoryBot.create(:employee2, department: department1)
      employee3 = FactoryBot.create(:employee3, department: department2)
      #会社
      customer1 = FactoryBot.create(:customer1)
      customer2 = FactoryBot.create(:customer2)
      #利用者
      customeruser1 = FactoryBot.create(:customeruser1, customer: customer1)
      customeruser2 = FactoryBot.create(:customeruser2, customer: customer2)
      #パッケージ
      package = FactoryBot.create(:package1)
      #機能
      feature = FactoryBot.create(:feature1, package: package)

      #レポート
      FactoryBot.create(:project2, customer: customer1 , customeruser: customeruser1, department: department1, employee: employee2, package: package, feature: feature )
      FactoryBot.create(:project3, customer: customer2 , customeruser: customeruser2, department: department1, employee: employee2, package: package, feature: feature )
      FactoryBot.create(:project4, customer: customer2 , customeruser: customeruser2, department: department2, employee: employee3, package: package, feature: feature )

      visit root_path
      click_link 'login'
      fill_in 'employee_email', with: 'user2@gmail.com'
      fill_in 'employee_password', with: 'password'
      click_button 'login'
      #詳細ボタン確認
      all('tr td')[6].click_link 
      expect(page).to have_content  'レポート検索'
      click_button '削除'
      page.accept_alert
       expect(page).to have_content  '作成したレポートが削除されました。'

    end

    it 'レポート作成者以外は編集・削除ができない' do

      #部署
      department1 = FactoryBot.create(:department1)
      department2 = FactoryBot.create(:department2)
      #ログインユーザー
      employee2 = FactoryBot.create(:employee2, department: department1)
      employee3 = FactoryBot.create(:employee3, department: department2)
      employee4 = FactoryBot.create(:employee4, department: department2)
      #会社
      customer1 = FactoryBot.create(:customer1)
      customer2 = FactoryBot.create(:customer2)
      #利用者
      customeruser1 = FactoryBot.create(:customeruser1, customer: customer1)
      customeruser2 = FactoryBot.create(:customeruser2, customer: customer2)
      #パッケージ
      package = FactoryBot.create(:package1)
      #機能
      feature = FactoryBot.create(:feature1, package: package)

      #レポート
      FactoryBot.create(:project2, customer: customer1 , customeruser: customeruser1, department: department1, employee: employee2, package: package, feature: feature )
      FactoryBot.create(:project3, customer: customer2 , customeruser: customeruser2, department: department1, employee: employee2, package: package, feature: feature )
      FactoryBot.create(:project4, customer: customer2 , customeruser: customeruser2, department: department2, employee: employee3, package: package, feature: feature )

      visit root_path
      click_link 'login'
      fill_in 'employee_email', with: 'user4@gmail.com'
      fill_in 'employee_password', with: 'password'
      click_button 'login'
      #詳細ボタン確認
      all('tr td')[6].click_link 
      expect(page).to have_content  'レポート検索'
      expect(page).to_not have_button '編集'
    end


    it '状況確認する。(お気に入り機能)' do

      #部署
      department1 = FactoryBot.create(:department1)
      department2 = FactoryBot.create(:department2)
      #ログインユーザー
      employee2 = FactoryBot.create(:employee2, department: department1)
      employee3 = FactoryBot.create(:employee3, department: department2)
      #会社
      customer1 = FactoryBot.create(:customer1)
      customer2 = FactoryBot.create(:customer2)
      #利用者
      customeruser1 = FactoryBot.create(:customeruser1, customer: customer1)
      customeruser2 = FactoryBot.create(:customeruser2, customer: customer2)
      #パッケージ
      package = FactoryBot.create(:package1)
      #機能
      feature = FactoryBot.create(:feature1, package: package)

      #レポート
      FactoryBot.create(:project2, customer: customer1 , customeruser: customeruser1, department: department1, employee: employee2, package: package, feature: feature )
      FactoryBot.create(:project3, customer: customer2 , customeruser: customeruser2, department: department1, employee: employee2, package: package, feature: feature )
      FactoryBot.create(:project4, customer: customer2 , customeruser: customeruser2, department: department2, employee: employee3, package: package, feature: feature )

      visit root_path
      click_link 'login'
      fill_in 'employee_email', with: 'user2@gmail.com'
      fill_in 'employee_password', with: 'password'
      click_button 'login'
      #詳細ボタン確認
      all('tr td')[6].click_link 
      expect(page).to have_content  'レポート検索'
      click_button '状況管理する'
      expect(page).to have_content  '状況確認を確認したい会社に設定しました。'

    end

    it '状況確認を解除する。(お気に入り機能)' do

      #部署
      department1 = FactoryBot.create(:department1)
      department2 = FactoryBot.create(:department2)
      #ログインユーザー
      employee2 = FactoryBot.create(:employee2, department: department1)
      employee3 = FactoryBot.create(:employee3, department: department2)
      #会社
      customer1 = FactoryBot.create(:customer1)
      customer2 = FactoryBot.create(:customer2)
      #利用者
      customeruser1 = FactoryBot.create(:customeruser1, customer: customer1)
      customeruser2 = FactoryBot.create(:customeruser2, customer: customer2)
      #パッケージ
      package = FactoryBot.create(:package1)
      #機能
      feature = FactoryBot.create(:feature1, package: package)

      #レポート
      FactoryBot.create(:project2, customer: customer1 , customeruser: customeruser1, department: department1, employee: employee2, package: package, feature: feature )
      FactoryBot.create(:project3, customer: customer2 , customeruser: customeruser2, department: department1, employee: employee2, package: package, feature: feature )
      FactoryBot.create(:project4, customer: customer2 , customeruser: customeruser2, department: department2, employee: employee3, package: package, feature: feature )

      #チェックテーブル
      FactoryBot.create(:check, customer: customer1 , employee: employee2 )

      visit root_path
      click_link 'login'
      fill_in 'employee_email', with: 'user2@gmail.com'
      fill_in 'employee_password', with: 'password'
      click_button 'login'
      #詳細ボタン確認
      all('tr td')[6].click_link 
      expect(page).to have_content  'レポート検索'
      click_button '状況管理から外す'
      expect(page).to have_content  '状況確認を解除にしました。'

    end

  end

end
