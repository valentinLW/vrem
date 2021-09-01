class Event < ApplicationRecord
  belongs_to :user
  has_many :messages
  has_many :invitations
  has_many :invited_users, through: :invitations, source: :user
  has_one_attached :image

  validates :name, presence: true, length: { minimum: 5, maximum: 20 }
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :image, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
