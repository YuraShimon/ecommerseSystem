class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.belongs_to :category, foreign_key: true
      t.belongs_to :product, foreign_key: true
      
      t.timestamps
    end
  end
end
