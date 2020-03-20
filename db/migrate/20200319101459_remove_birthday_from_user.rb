class RemoveBirthdayFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :birthday, :data
  end
end
