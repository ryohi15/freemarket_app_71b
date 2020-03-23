class RemoveAddBirthDayToUsersFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :AddBirth_dayToUsers, :string
  end
end