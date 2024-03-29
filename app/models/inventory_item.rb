class InventoryItem < ApplicationRecord
  def formatted_name
    "#{name} - R$#{price}"
  end
end
