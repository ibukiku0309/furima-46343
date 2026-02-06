FactoryBot.define do
  factory :record_address do
    postcode { '123-4567' }
    prefecture_id { 2 }
    municipalities { '横浜市緑区' }
    streetaddress { '1-1' }
    building { '東京ハイツ' }
    phonenumber { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
