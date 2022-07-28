class Category < ApplicationRecord
  has_many :posts
# validates :category, presence: true
end
