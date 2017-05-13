class CreateAuctions < ActiveRecord::Migration[5.0]
  def change
    create_table :auctions do |t|
      t.string :title,                null: false
      t.text :description,            null: false

      t.decimal :starting_price,      null: false, precision: 10, scale: 2
      t.decimal :buyout_price,        precision: 10, scale: 2, default: nil

      t.references :seller,           null: false
      t.datetime :expires_at,         null: false

      t.datetime :finished_at

      t.timestamps
    end
  end
end
