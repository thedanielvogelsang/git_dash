class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :uid
      t.string :username
      t.string :token
      t.string :image

      t.timestamps
    end
  end
end
