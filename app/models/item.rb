class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition

  with_options numericality: { other_than: 1 } do
    validates :shipping_area_id,:shipping_date_id,:shipping_charge_id,:category_id,:item_condition_id
  end

  with_options presence: true do
    validates :name,:introduction,:item_condition_id,:image,:price,:shipping_area,:shipping_date,:shipping_charge,:category,:item_condition
  end

  validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9999999 }
end
