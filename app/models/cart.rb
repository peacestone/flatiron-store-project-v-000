class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def add_item(item_id)
    line_item = line_items.find_or_initialize_by(item_id: item_id)
  end

  def total
    items.sum("price")
  end
  

end
