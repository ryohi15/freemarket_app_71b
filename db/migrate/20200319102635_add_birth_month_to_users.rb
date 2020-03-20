class AddBirthMonthToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :birth_month, :string
    add_column :users, :AddBirth_dayToUsers, :string
    add_column :users, :birth_day, :string
  end
end
