10.times do |n|
  User.seed do |s|
    s.email = "user-#{n}@test.com"
    s.password = "password"
  end
end