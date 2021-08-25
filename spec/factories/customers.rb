FactoryBot.define do

  factory :customer1, class: Customer do
    name { '中川コンツェルン' }
  end
  factory :customer2, class: Customer do
    name { 'サカタインダストリィ' }
  end
  factory :customer3, class: Customer do
    name { '霧島重工株式会社' }
  end

end