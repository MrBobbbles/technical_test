class Gallery < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  validates :name, presence: true
end
