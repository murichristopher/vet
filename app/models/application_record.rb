class ApplicationRecord < ActiveRecord::Base
  include ActionView::Helpers::TextHelper
  primary_abstract_class
end
