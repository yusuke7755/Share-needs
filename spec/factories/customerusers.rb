FactoryBot.define do

  factory :customeruser1, class: Customeruser do
    department { '総務部' }
    name { '山田太郎' }
    email { 'user1@email.com' }
    tel { '12345678901' }
    meta { 'test1' }
    # association :customer
  end

  factory :customeruser2, class: Customeruser do
    department { '総務部' }
    name { '山田花子' }
    email { 'user2@email.com' }
    tel { '12345678902' }
    meta { 'test2' }
    # association :customer
  end

  factory :customeruser, class: Customeruser do
    department { '管理部' }
    name { 'テスト' }
    email { 'user2@email.com' }
    tel { '12345678902' }
    meta { 'test2' }
      # association :customer
  end
end
