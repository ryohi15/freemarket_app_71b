class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :user_id
      t.integer :category_id
      t.integer :buyer_id
      t.string :name
      t.string :brand
      t.text :content
      t.string :status
      t.integer :price
      t.string :cost
      t.string :date

      t.timestamps
    end
  end
end
