class Upload < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many_attached :media
end
