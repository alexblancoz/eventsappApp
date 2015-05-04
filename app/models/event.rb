class Event < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  validates :user_id, presence: true
  validates :name, presence: true, length: {minimum: 5, maximum: 100}
  validates :description, presence: true, length: {minimum: 1, maximum: 500}
  validates :address, presence: false, length: {minimum: 0, maximum: 200}
  validates :price, presence: true
  validates :start_date, presence: true
  mount_uploader :picture, PictureUploader
  validate :picture_size
  
  private
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5mb")
      end
    end
end