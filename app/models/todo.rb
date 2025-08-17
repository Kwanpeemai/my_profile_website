class Todo < ApplicationRecord
  # enum status: { doing: 0, done: 1 }
  enum :status, [ :doing, :done ]
  validates :title, presence: true
end
