class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :size
      t.string :body
      t.float :price_in
      t.integer :price_out
      t.integer :price_sale
      t.integer :product_id
      t.integer :count
      t.date :date_in
      t.integer :sale
      t.integer :user_id

      t.timestamps
    end
  end
end
