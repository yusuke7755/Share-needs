FactoryBot.define do

  factory :project1, class: Project do
    title { '顧客削除用' }
    apoint_at { '2021-08-20' }
    deadline { '2021-08-30' }
    description { 'rspec' }
    priority { '1' }
    association :department
    association :employee
    association :package
    association :feature
  end

  factory :project2, class: Project do
    title { 'レポート検索' }
    apoint_at { '2021-08-20' }
    deadline { '2021-08-30' }
    description { 'rspec' }
    priority { '2' }
    # association :department
    # association :employee
    # association :customer
    # association :customeruser
    # association :package
    # association :feature
  end

  factory :project3, class: Project do
    title { 'テスト検索1' }
    apoint_at { '2021-08-25' }
    deadline { '2021-08-30' }
    description { 'rspec' }
    priority { '3' }
    # association :department
    # association :employee
    # association :customer
    # association :customeruser
    # association :package
    # association :feature

  end

  factory :project4, class: Project do
    title { 'テスト検索2' }
    apoint_at { '2021-08-25' }
    deadline { '2021-08-30' }
    description { 'rspec' }
    priority { '3' }
    # association :department
    # association :employee
    # association :customer
    # association :customeruser
    # association :package
    # association :feature
  
  end

end
