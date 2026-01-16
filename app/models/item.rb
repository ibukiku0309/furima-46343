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
  validates :price, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999
  }

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :fee_id
    validates :prefecture_id
    validates :shippingtime_id
  end
end
