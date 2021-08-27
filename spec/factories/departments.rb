FactoryBot.define do

  factory :department, class: Department do
    name { 'ログイン用' }
    web_flg { true }
  end
  factory :department1, class: Department do
    name { '営業部' }
    web_flg { true }
  end
  factory :department2, class: Department do
    name { 'サポート部' }
    web_flg { true }
  end
end

