class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :invitations
  has_many :events
  has_one_attached :profile_picture
  # has_many :events, through: :invitations
  has_many :events_as_guest, through: :invitations, source: :events
end
