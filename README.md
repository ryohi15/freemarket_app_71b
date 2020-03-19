# README

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
|password_confirmation|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|data|null: false|
|phone_number|integer||

### Association
- has_many :items
- has_one  :card
- has_many :addresses

## cardsテーブル  
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|number|integer|null: false, unique: true|
|month|integer|null: false|
|year|integer|null: false|
|security|integer|null: false, unique: true|

### Association
- belongs_to :user

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|postcode|integer|null:false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|block|string|null: false|

### Association
- belongs_to :user


## itemsテーブル  
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|name|string|null: false|
|content|text|null: false|
|status|string|null: false|
|price|integer|null: false|
|cost|string|null: false|
|date|string|null: false|

### Association
- belongs_to :user
- belongs_to :category
- has_many :images


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|image|text|null: false|
## Association
- belongs_to :item


## categoriesテーブル   
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|

## Association
- has_many :items
- has_ancestry