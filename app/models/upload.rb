class Upload < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_one_attached :media
end
