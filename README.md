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

# Item table
|colum|type|option|
|-----|----|------|
|item_name|string|null: false|
|price|integer|null: false|
|category|integer|null: false|
|item_condition|integer|null: false|
|introduction|text|null: false|
|prefecture_id|integer|null: false|
|user|references|foreign_key: true|

## association
- belongs_to :user
- has_many :comments
- has_one :purchase

# Purchase table
|colum|type|option|
|-----|----|------|
|address|string|null: false|
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