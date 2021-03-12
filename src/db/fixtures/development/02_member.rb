10.times do |n|
  Member.seed do |s|
    s.first_name = Faker::Name.first_name
    s.last_name = Faker::Name.last_name
    s.first_name_kana = Faker::Name.first_name
    s.last_name_kana = Faker::Name.last_name
    s.github_id = Faker::Alphanumeric.alpha(number: 10)
    s.twitter_id = Faker::Alphanumeric.alpha(number: 10)
    s.repository_url = "https://github.com/shiotani0011/manageboy"
    s.start_date = Faker::Date.between(from: '2020-01-01', to: '2021-04-01')
    s.memo = Faker::Food.description
  end
end