class ChatRoom < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy

  validates :title, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 100}
  validates :description, length: {minimum: 5, maximum: 1000}, allow_blank: true
end
