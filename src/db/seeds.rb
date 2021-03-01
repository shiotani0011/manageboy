3.times do |n|
  member = Member.new(
    first_name: "田中",
    last_name: "太郎",
    first_name_kana: "タナカ",
    last_name_kana: "タロウ",
    github_id: "aaa",
    twitter_id: "aaa",
    repository_url: "aaa",
    memo: "aaa",
    deleted_flag: "null",
    start_date: "2021-01-01",
  )
  member.save!
end