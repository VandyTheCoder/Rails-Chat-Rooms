class ChatRoom < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy

  validates :title, presence: true
  validates :description, length: {minimum: 5, maximum: 120}, allow_blank: true
end
