FactoryBot.define do
  factory :card do
    prefecture_id {2}
    municipalities {"市町村"}
    address {"住所"}
    postal_code {"000-0000"}
    building_number {"建物名"}
    telephone_number {"00000000000"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end