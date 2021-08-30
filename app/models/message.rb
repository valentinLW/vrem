class Message < ApplicationRecord
  belongs_to :event
  belongs_to :user
  validates :content, presence: true, length: { minimum: 1 }
end
