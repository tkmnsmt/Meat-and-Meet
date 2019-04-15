class Post < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
  mount_uploader :image, ImageUploader
  belongs_to :user


  validates :image, :url, :address, :restaurant_name, :taste, :cost_performance, :service, :atmosphere, :reputation, :genre, :average, presence: true

  def average
    (self.taste + self.cost_performance + self.atmosphere + self.service) / 4.0
  end
end
