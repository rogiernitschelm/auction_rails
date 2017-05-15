class CreateComplaints < ActiveRecord::Migration[5.0]
  def change
    create_table :complaints do |t|
      t.string :title
      t.string :content
      t.references :user, foreign_key: true
      t.references :target_user, references: :user

      t.timestamps
    end
  end
end
