FactoryBot.define do
    factory :feature1, class: Feature do
      name { '商品管理機能' }
      association :package
    end
    factory :feature2, class: Feature do
      name { '販売管理機能' }
      association :package
    end
    factory :feature3, class: Feature do
      name { '顧客管理機能' }
      association :package
    end

end
