# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## postsテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, foreign_key: true|
|image|string||
|title|string||
|country|string|null: false|
|city|string||
|how|string||
|discription|text|null:false|
|like_count|integer||
|user_id|reference|null: false, foreign_key: true|

### Association
-belongs_to :user, optional: true
-has_many :comments
-has_many :likes, dependent: :destroy



## usersテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, foreign_key: true|
|username|string|null: false, unique: true|
|email|string|null: false, unique: true|
|fav_country|string|null: false|
|fav_spot|string||
|introduction|text|null: false|
|sns_hp|text||

### Association
-has_many :posts, dependent: :destroy
-has_many :comments
-has_many :likes, dependent: :destroy
-has_many :messages



## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, foreign_key: true|
|content|text|null: false|
|post_id|reference|null: false, foreign_key: true|
|user_id|reference|null: false, foreign_key: true|

### Association
-belongs_to :user
-belongs_to :post



## likesテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, foreign_key: true|
|post_id|reference|null: false, foreign_key: true|
|user_id|reference|null: false, foreign_key: true|

### Association
-belongs_to :post, counter_cache: :like_count
-belongs_to :user



## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, foreign_key: true|
|email|string|null: false|
|content|text|null: false|

### Association
-belongs_to :user



##以下は検索機能変更前に使用していたテーブル
##今後機能を追加した際に使用する可能性があるため保存のまま

## areasテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, foreign_key: true|
|name|string||

### Association
-has_many :countries

## countriesテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, foreign_key: true|
|name|string||
|area_id|reference|null: false, foreign_key: true|

### Association
-belongs_to :area



