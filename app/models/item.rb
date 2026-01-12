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
  validates :price, presence: true

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :fee_id
    validates :prefecture_id
    validates :shippingtime_id
  end
end
