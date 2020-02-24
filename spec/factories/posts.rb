FactoryBot.define do

  factory :post do
    user_id       {"1"}
    title         {"ソウルタワー"}
    country       {"韓国"}
    city          {"ソウル"}
    how           {"iPhone"}
    discription   {"素敵な夜景が見れてよかったです！"}
    created_at    { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    image         { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/background.jpg')) }
    user
  end
end