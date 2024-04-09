class Customer < ApplicationRecord
  has_many :pets, dependent: :destroy
  has_many :service_queue_items, dependent: :destroy
  has_many :service_orders, dependent: :destroy
end
