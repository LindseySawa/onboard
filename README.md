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
|country|string||
|city|string||
|how|string||
|discription|text|null:false|
|like_count|integer||
|user_id|reference|null: false, foreign_key: true|

### Association
belongs_to :user, optional: true
has_many :comments
has_many :likes, dependent: :destroy



## usersテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, foreign_key: true|
|username|string|null: false|
|email|string|null: false|
|fav_country|string|null: false|
|fav_spot|string||
|introduction|text|null: false|
|sns_hp|text||

### Association
has_many :posts, dependent: :destroy
has_many :comments
has_many :likes, dependent: :destroy



## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, foreign_key: true|
|content|text||
|post_id|reference|null: false, foreign_key: true|
|user_id|reference|null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :post



## likesテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, foreign_key: true|
|post_id|reference|null: false, foreign_key: true|
|user_id|reference|null: false, foreign_key: true|

### Association


## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, foreign_key: true|
|email|string|null: false|
|content|text|null: false|

### Association


