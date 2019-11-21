class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :user_id
      t.string :user_email
      t.integer :product_id
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
