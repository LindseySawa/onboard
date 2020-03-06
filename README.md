# README

## アプリ

OnBoard

## 概要

LindseySawa/onboard(https://github.com/LindseySawa/onboard) 
- ガイドブックに載ってないよりローカルでレアな情報を共有、旅行先検索ツール。

## 制作理由

ある国を旅行した際、一番栄えているダウンタウンには日本からの観光客は全く見かけませんでした.　　
人気の国ではあるのに、なぜ全く見かけないんだろう？と思っていました。　　
しかし、ガイドブックやインターネットで調べた場所には団体ツアー？と思うほど多くの日本人が訪問していました。　　
その光景を目にし、自身が得た情報を含め"情報が少ない・偏っている"思いました。　　
そこで”ローカルな情報、レアな情報を簡単に共有できる場所があったら良い・よりいい旅にできる”と思い作成にいたりました。　　



## デプロイ先

http://18.178.109.224

  - テストアカウント
    - アドレス: 'onboard@onboard'
    - パスワード: '12345678'

## 工夫した点
- 写真の邪魔にならないようにデザインを可能な限りシンプルに作成
- いいね！機能の数を表示なし（数の先入観でいいねを避けるため、実際はTOPページのランキングのために数をカウント）
- ページ数を少なくするために検索ページの結果表示部分に最新投稿を表示
- 検索ページにて投稿内容が見やすいように、マウスをのせると”国”と”タイトル”を表示
- どこで撮影をしたなどの旅行先の情報のみならず、写真好きな人（自身も含め）な人用に何で撮影したかを写真情報に追加

## 現在準備中の機能
- 投稿の際の写真のプレビュー
- お問い合わせフォーム

## 今後実装したい機能
- 写真の複数投稿
- 検索フォームを現在のフリーワードのみならず、選択検索などの項目を増やす
- APIを使用し、写真の旅行をピン立てなどの地図機能


=======================================================================================
## Name

OnBoard

## Overview

LindseySawa/onboard(https://github.com/LindseySawa/onboard) 
- OnBoard is your destination finder for your trip. To make your next trip more valuable and special, find and share your pictures.

## Usage

https://github.com/LindseySawa/onboard.git



### posts table

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

#### Association
-belongs_to :user, optional: true
-has_many :comments
-has_many :likes, dependent: :destroy



### users table

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, foreign_key: true|
|username|string|null: false, unique: true|
|email|string|null: false, unique: true|
|fav_country|string|null: false|
|fav_spot|string||
|introduction|text|null: false|
|sns_hp|text||

#### Association
-has_many :posts, dependent: :destroy
-has_many :comments
-has_many :likes, dependent: :destroy
-has_many :messages



### comments table

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, foreign_key: true|
|content|text|null: false|
|post_id|reference|null: false, foreign_key: true|
|user_id|reference|null: false, foreign_key: true|

#### Association
-belongs_to :user
-belongs_to :post



### likes table

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, foreign_key: true|
|post_id|reference|null: false, foreign_key: true|
|user_id|reference|null: false, foreign_key: true|

#### Association
-belongs_to :post, counter_cache: :like_count
-belongs_to :user



### messages table

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, foreign_key: true|
|email|string|null: false|
|content|text|null: false|

#### Association
-belongs_to :user


##以下は検索機能変更前に使用していたテーブル
##今後機能を追加した際に使用する可能性があるため保存のまま

### areas table

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, foreign_key: true|
|name|string||

### Association
-has_many :countries

## countries table

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, foreign_key: true|
|name|string||
|area_id|reference|null: false, foreign_key: true|

#### Association
-belongs_to :area



