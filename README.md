# User table
|colum|type|option|
|-----|----|------|
|email|string|null: false|
|nickname|string|null: false|
|password|string|null: false|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|birth_day|date|null: false|

## association
- has_many :items
- has_many :comments
- has_many :purchases


# Item table
|colum|type|option|
|-----|----|------|
|name|string|null: false|
|price|integer|null: false|
|introduction|text|null: false|
|shipping_area_id|integer|null: false|
|shipping_date_id|integer|null: false|
|shipping_charge_id|integer|null: false|
|category_id|integer|null: false|
|item_condition_id|integer|null: false|
|user|references|foreign_key: true|

## association
- belongs_to :user
- has_many :comments
- has_one :purchase


# Address table
|colum|type|option|
|-----|----|------|
|prefecture_id|integer|null: false|
|municipalities|string|null: false|
|address|string|null: false|
|postal_code|string|null: false|
|building_number|string| |
|telephone_number|string|null: false|
|purchase|references|foreign_key: true|

## association
- belongs_to :purchase


# Purchase table
|colum|type|option|
|-----|----|------|
|user|references|foreign_key: true|
|item|references|foreign_key: true|

## association
- belongs_to :user
- belongs_to :item
- has_one :address


# Comment table
|colum|type|option|
|-----|----|------|
|content|text|null: false|
|user|references|foreign_key: true|
|item|references|foreign_key: true|

## association
- belongs_to :user
- belongs_to :item