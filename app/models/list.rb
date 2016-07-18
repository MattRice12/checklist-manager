class List < ApplicationRecord
  has_many :tasks

  validates :name, length: { minimum: 1, maximum: 50 }
end
