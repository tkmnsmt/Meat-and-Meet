class Post < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user, dependent: :destroy
  # validates :reputation, length: { maximum: 10 }
  validates :image, :url, :address, :restaurant_name, :taste, :cost_performance, :service, :atmosphere, :reputation, :genre, :average, presence: true

  def average
    (self.taste + self.cost_performance + self.atmosphere + self.service) / 4.0
  end

  private
  def geocode
    uri = URI.escape("https://maps.googleapis.com/maps/api/geocode/json?address="+self.address.gsub(" ", "")+"&key=AIzaSyCzCKcmeaX7BJD2w73W5BZT3Mk_twwfX_M")
    res = HTTP.get(uri).to_s
    response = JSON.parse(res)
    self.latitude = response["results"][0]["geometry"]["location"]["lat"]
    self.longitude = response["results"][0]["geometry"]["location"]["lng"]
  end
end
