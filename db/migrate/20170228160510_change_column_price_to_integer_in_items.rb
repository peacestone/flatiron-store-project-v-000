class ChangeColumnPriceToIntegerInItems < ActiveRecord::Migration
  def change
    change_column :items, :price, :integer
  end
end
