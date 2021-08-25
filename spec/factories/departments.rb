FactoryBot.define do

  factory :department, class: Department do
    name { '営業部' }
    web_flg { true }
  end

end

# FactoryGirl.define do
#   factory :department, :class => 'Department' do
#     name { '営業部' }
#     web_flg { true }
#   end
# end