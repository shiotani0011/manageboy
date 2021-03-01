class Member < ApplicationRecord
  validates :first_name, :last_name, :first_name_kana, :last_name_kana, :github_id, :twitter_id,
  :repository_url, :start_date, :memo, :deleted_flag, presence: true
end