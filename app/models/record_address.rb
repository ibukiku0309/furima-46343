class RecordAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :municipalities, :streetaddress, :building, :phonenumber,
                :record_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode
    validates :prefecture_id
    validates :municipalities
    validates :streetaddress
    validates :phonenumber
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :postcode, format: { with: /\A\d{3}-\d{4}\z/, message: 'は3桁-4桁の形式で入力してください' }
  validates :phonenumber, format: { with: /\A\d{10,11}\z/, message: 'は10〜11桁の半角数字で入力してください' }

  def save
    records = Record.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, municipalities: municipalities,
                   streetaddress: streetaddress, building: building, phonenumber: phonenumber,
                   record_id: records.id)
  end
end
