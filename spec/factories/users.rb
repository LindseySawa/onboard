FactoryBot.define do

  factory :user do
    # id                      {1}
    # sequence(:username)     {Faker::Internet.username}
    username                {"Hanako"}
    email                   {"kkk@gmail.com"}
    password                {"00000000"}
    password_confirmation   {"00000000"}
    fav_country             {"韓国"}
    fav_spot                {"スウォン"}
    introduction            {"よろしくお願いします！"}
    sns_hp                  {"taro@yahoo.co.jp"}
  end

end