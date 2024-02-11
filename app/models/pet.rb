class Pet < ApplicationRecord
  belongs_to :customer

  enum status: { active: 0, inactive: 1 }
  enum sex: { male: 0, female: 1 }
  enum situation: { alive: 0, dead: 1, donated: 2, abandoned: 3 }

  default_scope -> { where(status: :active) }

  # validates :name, :customer_id, :sex, :castrated, :birthday, :race, :specie, :size, :weight,
  # :color, :situation, presence: true

  validates :name, presence: true
  has_one_attached :image
  def formatted_name
    truncate(name, length: 25)
  end
end
