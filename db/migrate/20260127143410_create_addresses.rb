class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :postcode, null: false
      t.integer :prefecture_id, null: false
      t.string :municipalities, null: false
      t.string :streetaddress, null: false
      t.string :building, null: false
      t.string :phonenumber, null: false
      t.references :record, null: false, foreign_key: true
      t.timestamps
    end
  end
end
