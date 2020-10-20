# User table
|colum|type|option|
|-----|----|------|
|email|string|null: false|
|nickname|string|null: false|
|password|string|null: false|

## association
- has_many :items
- has_many :comments
- has_one :profile

# Profile table
|colum|type|option|
|-----|----|------|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|birth_year|date|null: false|
|birth_month|date|null: false|
|birth_day|date|null: false|
|user|references| |

## association
- belongs_to :user

# Item table
|colum|type|option|
|-----|----|------|
|item_name|string|null: false|
|seller_name|string|null: false|
|category|string|null: false|
|item_condition|string|null: false|
|introduction|text|null: false|
|price|integer|null: false|
|prefecture_id|integer|null: false|
|user|references| |
|image|ActiveStrageで実装| |

## association
- belongs_to :user
- has_many :comments

# Comment table
|colum|type|option|
|-----|----|------|
|comment|text|null: false|
|user|references| |
|item|references| |

## association
- belongs_to :user
- belongs_to :item