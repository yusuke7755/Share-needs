FactoryBot.define do

  factory :customer, class: Customer do
    name { '中川コンツェルン' }
    address { 'test1@email.com' }
    tel { '12345678901' }
    meta { 'ログイン・ログアウト、顧客登録用' }
    user_flg { true }
  end

  factory :customer1, class: Customer do
    name { 'サカタインダストリィ' }
    address { 'test2@email.com' }
    tel { '12345678901' }
    user_flg { false }
  end
  factory :customer2, class: Customer do
    name { '霧島重工株式会社' }
    address { 'test3@email.com' }
    tel { '12345678901' }
    user_flg { true }
  end

end