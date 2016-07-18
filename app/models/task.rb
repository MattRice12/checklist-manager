class Task < ApplicationRecord
  belongs_to :list

  validates :body, length: { minimum: 1, maximum: 300 }
  validates :position, numericality: { only_integer: true }
end
