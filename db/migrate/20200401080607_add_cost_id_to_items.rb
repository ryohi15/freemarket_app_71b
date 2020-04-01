class AddCostIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :cost_id, :integer
  end
end
