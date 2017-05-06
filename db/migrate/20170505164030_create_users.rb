class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email,              null: false
      t.string :password_digest,    null: false

      t.string :first_name,         null: false
      t.string :last_name,          null: false
      t.string :infix

      t.string :city
      t.string :birth_date
      t.string :gender

      t.boolean :admin,             null: false, default: false

      t.timestamps
    end
  end
end
