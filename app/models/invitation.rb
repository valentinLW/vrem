class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :event
  enum status: %i[pending accepted rejected]
  validates :user, uniqueness: { scope: :event, message: "user already invited" }
end
