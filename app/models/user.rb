class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :groups
  has_many :entities, foreign_key: 'author_id'
  attr_accessor :full_name
end
