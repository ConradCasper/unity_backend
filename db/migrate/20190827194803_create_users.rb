class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :avatar, default: "http://sap-certification.info/img/default-avatar.jpg"
      t.string :background_img, default: "http://blogs.discovermagazine.com/d-brief/files/2019/02/Ocean-Blue.jpg"
      t.string :bio
      t.string :interests
      t.string :favorite_bands
      t.string :city

      t.timestamps
    end
  end
end
