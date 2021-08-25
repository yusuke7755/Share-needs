require 'rails_helper'

RSpec.describe "取引先担当者", type: :system do

  context '利用者登録の処理' do

    it '登録確認のメッセージが表示される' do

      #ログインユーザー
      FactoryBot.create(:employee1)
      #企業
      FactoryBot.create(:customer1)
      FactoryBot.create(:customer2)
      FactoryBot.create(:customer3)
      visit root_path
      click_link 'login'
      fill_in 'employee_email', with: 'user1@gmail.com'
      fill_in 'employee_password', with: 'password'
      click_button 'login'
      #ユーザー登録に移動
      click_button 'customer_user_create'

       fill_in 'customeruser_department'

      expect(page).to have_content 'ユーザ登録しました。'


    end


  end

end
