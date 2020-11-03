class Card
  include ActiveModel::Model
  attr_accessor :prefecture_id, :municipalities, :address, :postal_code, :building_number, :telephone_number

  with_options presence: true do
    validates :municipalities
    validates :address
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :telephone_number, format: { with: /\A\d{,11}\z/ }
  end
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(prefecture_id: prefecture_id, municipalities: municipalities, address: address, postal_code: postal_code, building_number: building_number, telephone_number: telephone_number, purchase_id: purchase.id)
  end
end