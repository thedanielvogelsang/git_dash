class CreatePulls < ActiveRecord::Migration[5.1]
  def change
    create_table :pulls do |t|
      t.string :title
      t.string :url
      t.text :body
      t.string :created_at
      t.string :merge_commit_sha

      t.timestamps
    end
  end
end
