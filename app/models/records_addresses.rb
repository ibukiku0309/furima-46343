class RecordsAddresses
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :municipalities, :streetaddress, :building, :phonenumber,
                :record_id

  # ここにバリデーションの処理を書く

  def save
    records = Records.create(user_id: user_id, item_id: item_id)
    Addresses.create(postcode: postcode, prefecture_id: prefecture_id, municipalities: municipalities,
                     streetaddress: streetaddress, building: building, phonenumber: phonenumber,
                     record_id: records.id)
  end
end
