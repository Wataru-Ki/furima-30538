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

## association
- has_many :items
- has_many :comments
- has_one :purchase

# Item table
|colum|type|option|
|-----|----|------|
|category|integer|null: false|
|item_condition|integer|null: false|
|introduction|text|null: false|

## association
- belongs_to :user
- has_many :comments

# Purchase table
|colum|type|option|
|-----|----|------|
|user_id|integer|null: false|
|item_id|integer|null: false|

## association
- belongs_to :user

# Comment table
|colum|type|option|
|-----|----|------|
|comment|text|null: false|
|user_id|integer|null: false|
|item_id|integer|null: false|

## association
- belongs_to :user
- belongs_to :item