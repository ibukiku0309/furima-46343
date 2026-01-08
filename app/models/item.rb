class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :shippingtime

  validates :image, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :fee_id, presence: true
  validates :prefecture_id, presence: true
  validates :shippingtime_id, presence: true

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :fee_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shippingtime_id, numericality: { other_than: 1, message: "can't be blank" }
end
