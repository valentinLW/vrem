class Event < ApplicationRecord
  belongs_to :user
  has_many :messages
  has_one_attached :image

  validates :name, presence: true, length: { maximum: 18 }
  validates :start_time, presence: true
  validates :end_time, presence: true
end
