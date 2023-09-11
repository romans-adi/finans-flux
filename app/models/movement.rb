class Movement < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates :name, presence: true, length: { minimum: 1, maximum: 30 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
