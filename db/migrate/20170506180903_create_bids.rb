class CreateBids < ActiveRecord::Migration[5.0]
  def change
    create_table :bids do |t|
      t.decimal :amount,              null: false, precision: 10, scale: 2
      t.references :buyer,            null: false
      t.references :auction,          null: false
      t.datetime :placed_at,          null: false

      t.timestamps
    end
  end
end
