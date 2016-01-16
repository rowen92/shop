class Product < ActiveRecord::Base

  belongs_to :category
  has_many :line_items, dependent: :destroy

  before_destroy :ensure_not_referenced

  validates :title, :description, :image, :price, presence: true
  validates :title, uniqueness: true

  self.per_page = 3

  mount_uploader :image, ProductUploader

  def to_param
    "#{id}-#{title.parameterize}"
  end

  private

  def ensure_not_referenced
    if line_items.empty?
      true
    else
      errors.add(:base, 'Line Items present')
      false
    end
  end

  def self.search(query)
    where('title LIKE ? OR description LIKE ?', "%#{query}%", "%#{query}%")
  end

  def self.search_for_ajax(query)
    where('title LIKE ? OR description LIKE ?', "%#{query}%", "%#{query}%").select(:id, :title)
  end

end
