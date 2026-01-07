class Shippingtime < ApplicationRecord
  include ActiveHash::Associations
  has_many :items
end
