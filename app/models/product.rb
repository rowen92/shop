class Product < ActiveRecord::Base

  belongs_to :category
  has_many :line_items, dependent: :destroy

  validates :title, presence: true, uniqueness: true

  mount_uploader :image, ProductUploader

  def to_param
    "#{id}-#{title.parameterize}"
  end

end
