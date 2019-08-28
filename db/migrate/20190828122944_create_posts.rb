class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :content
      t.string :type
      t.string :img_url

      t.timestamps
    end
  end
end
