FactoryBot.define do

  factory :employee1, class: Employee do
    name { 'ログイン・顧客登録用' }
    email { 'user1@gmail.com' }
    password { 'password' }
    association :department
    admin { false }
  end

  factory :employee2, class: Employee do
    name { '社員2' }
    email { 'user2@gmail.com' }
    password { 'password' }
    association :department
    admin { false }
  end

  factory :employee3, class: Employee do
    name { '社員3' }
    email { 'user3@gmail.com' }
    password { 'password' }
    association :department
    admin { false }
  end

  factory :employee4, class: Employee do
    name { '社員4' }
    email { 'user4@gmail.com' }
    password { 'password' }
    association :department
    admin { false }
  end

  factory :employee5, class: Employee do
    name { '社員5' }
    email { 'user5@gmail.com' }
    password { 'password' }
    association :department
    admin { false }
  end

  factory :employee7, class: Employee do
    name { '上司1' }
    email { 'admin1@gmail.com' }
    password { 'password' }
    admin { true }
  end

end
