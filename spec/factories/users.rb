FactoryBot.define do
  factory :user do
    name { "佐藤千尋" }
    nickname { "CHIHIRO" }
    email { "chihiro@gmai.com" }
    password { "111qqq" }
    password_confirmation { password }    
  end
end
