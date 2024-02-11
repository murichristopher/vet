class ApplicationRecord < ActiveRecord::Base
  include ActionView::Helpers::TextHelper
  primary_abstract_class
  scope :search, ->(query) { where("name LIKE ?", "%#{query}%") }
end
