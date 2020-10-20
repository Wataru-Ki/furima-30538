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
- has_one :purchase
- has_one :address


# Item table
|colum|type|option|
|-----|----|------|
|item_name|string|null: false|
|price|integer|null: false|
|introduction|text|null: false|
|shipping_area_id|integer|null: false|
|sipping_date_id|integer|null: false|
|sipping_charge_id|integer|null: false|
|category_id|integer|null: false|
|item_condition_id|integer|null: false|
|prefecture_id|integer|null: false|
|user|references|foreign_key: true|

## association
- belongs_to :user
- has_many :comments
- has_one :purchase


# Address table
|colum|type|option|
|-----|----|------|
|postal_code|integer|null: false|
|prefecture_id|integer|null: false|
|address|text|null: false|
|user_id|references|foreign_key: true|

## association
- belongs_to :user


# Purchase table
|colum|type|option|
|-----|----|------|
|user|references|foreign_key: true|
|item|references|foreign_key: true|

## association
- belongs_to :user
- belongs_to :item


# Comment table
|colum|type|option|
|-----|----|------|
|comment|text|null: false|
|user|references|foreign_key: true|
|item|references|foreign_key: true|

## association
- belongs_to :user
- belongs_to :item