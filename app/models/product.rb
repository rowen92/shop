class Product < ActiveRecord::Base

  belongs_to :category
  has_many :line_items, dependent: :destroy

  validates :title, presence: true, uniqueness: true

  mount_uploader :image, ProductUploader

  def to_param
    "#{id}-#{title.parameterize}"
  end

  before_destroy :ensure_not_referenced_by_any_line_item

  private

  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      true
    else
      errors.add(:base, 'Line Items present')
      false
    end
  end

end
