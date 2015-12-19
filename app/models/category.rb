class Category < ActiveRecord::Base

  has_many :products

  validates :title, presence: true, uniqueness: true

  mount_uploader :image, CategoryUploader

end
