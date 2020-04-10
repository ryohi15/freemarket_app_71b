# README

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|password_confirmation|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_year|string|null: false|
|birth_month|string|null: false|
|birth_day|string|null: false|
|phone_number|integer||

### Association
- has_many :items
- has_one  :card
- has_many :addresses

## cardsテーブル  
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|customoer_id|integer|null: false|
|card_id|integer|null: false|

### Association
- belongs_to :user

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|postcode|string|null:false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|block|string|null: false|
|apartment_number|string||
### Association
- belongs_to :user


## itemsテーブル  
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|buyer_id|integer|null: false|
|seller_id|integer|null: false|
|name|string|null: false|
|brand|string|null: false|
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
|name|string||
|ancestry|string||

## Association
- has_many :items
- has_ancestry

あ