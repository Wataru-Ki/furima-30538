class Item < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :introduction, presence: true
  validates :shipping_area_id, presence: true
  validates :shipping_date_id, presence: true
  validates :shipping_charge_id, presence: true
  validates :category_id, presence: true
  validates :item_condition_id, presence: true
  validates :image, presence: true

  belongs_to :user
  has_one_attached :image
end
