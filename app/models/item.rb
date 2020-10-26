class Item < ApplicationRecord
  validates :name, presence: true
  validates :introduction, presence: true
  validates :item_condition_id, presence: true
  validates :image, presence: true

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_area
  validates :shipping_area, presence: true
  validates :shipping_area_id, numericality: { other_than: 1 }
  belongs_to_active_hash :shipping_date
  validates :shipping_date, presence: true
  validates :shipping_date_id, numericality: { other_than: 1 }
  belongs_to_active_hash :shipping_charge
  validates :shipping_charge, presence: true
  validates :shipping_charge_id, numericality: { other_than: 1 }
  belongs_to_active_hash :category
  validates :category, presence: true
  validates :category_id, numericality: { other_than: 1 }
  belongs_to_active_hash :item_condition
  validates :item_condition, presence: true
  validates :item_condition_id, numericality: { other_than: 1 }

  validates :price, presence: true, numericality: { only_integer: true }
end
