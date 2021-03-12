class Members < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :first_name_kana, null: false
      t.string :last_name_kana, null: false
      t.string :github_id
      t.string :twitter_id
      t.text :repository_url
      t.date :start_date, null: false
      t.text :memo

      t.timestamps
    end
  end
end
