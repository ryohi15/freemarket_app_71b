class RemoveCostFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :cost, :string
  end
end
