class AddDeliveryDayIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :delivery_day_id, :integer
  end
end
