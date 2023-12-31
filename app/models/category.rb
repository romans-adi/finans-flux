class Category < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :movements

  validates :name, presence: true, length: { minimum: 1, maximum: 30 }

  def total_amount(user_id)
    movements.where(user_id:).sum(:amount)
  end
end
