class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :user_id, null: false
      t.integer :category_id, null: false
      t.string :name,null: false
      t.text :content, null: false
      t.string :status, null: false
      t.integer :price, null: false
      t.string :cost, null: false
      t.string :date, null: false
      t.timestamps
    end
  end
end
