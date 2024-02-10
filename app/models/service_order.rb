class ServiceOrder < ApplicationRecord
  belongs_to :customer
  belongs_to :pet
  belongs_to :inventory_item
end
