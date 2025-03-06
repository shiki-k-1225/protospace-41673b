class Prototype < ApplicationRecord
  # アソシエーションの追加
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy

  # バリデーションの追加
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :image, presence: true
end
