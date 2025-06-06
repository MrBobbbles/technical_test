class Photo < ApplicationRecord
  belongs_to :gallery
  has_one_attached :image
  after_commit :generate_thumbnail, on: [ :create, :update ]
  validates :name, :image, presence: true

  private
  def generate_thumbnail
    return unless image.attached?
    image.variant(resize_to_limit: [ 150, 150 ]).processed
  end
end
