FactoryBot.define do

  factory :customer, class: Customer do
    user_flg { true }
    name { '中川コンツェルン' }
    address { 'test1@email.com' }
    tel { '12345678901' }
    # user_flg { 2 }
  end

  factory :customer1, class: Customer do
    name { 'サカタインダストリィ' }
    address { 'test2@email.com' }
    tel { '12345678901' }
    # user_flg { 1 }
  end

  factory :customer2, class: Customer do
    name { '霧島重工株式会社' }
    address { 'test3@email.com' }
    tel { '12345678901' }
    # user_flg { 2 }
  end
  
end

