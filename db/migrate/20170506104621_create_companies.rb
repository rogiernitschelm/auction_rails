class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :country, default: 'The Netherlands', null: false
      t.string :telephone, null: false
      t.string :email, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :business, null: false
      t.string :chamber_of_commerce, null: false
      t.boolean :verified, null: false, default: false

      t.timestamps
    end

    add_reference :sellers, :company
    add_reference :buyers, :company
  end
end
