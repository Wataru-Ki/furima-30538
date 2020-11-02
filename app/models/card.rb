class Card
  include ActiveModel::Model
  attr_accessor :prefecture, :municipalities, :address, :postal_code, :building_number, :telephone_number

  with_options presence: true do
    validates :municipalities
    validates :address
    validates :postal_code
    validates :building_number
    validates :telephone_number
  end
  validates :prefecture, numericality: { other_than: 1 }

  def save
    purchase = Purchase.create()
    Address.create(municipalities: municipalities, address: address, postal_code: postal_code, building_number: building_number, telephone_number: telephone_number)
  end