class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :content, presence: true
  has_many :reads
  has_many :users, through: :reads
end
