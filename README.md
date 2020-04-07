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

# fremar DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unipue: true|
|email|string|null: false, unique: true|
|password|string|null: false|
### Association
- has_many :posts
- has_many :likes
- has_many :likes_posts, through: :likes, source: :post

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null, false|
|body|text|null, false|
|image|string||
|material|string||
|user_id|integer|null: false, foreign_key: true|
|likes_count|integer||
|category_id|integer|null: false, foreign_key: true|
### Association
- has_many :likes
- has_many :likes_users, through: :likes, source: :user
- belongs_to :user, foreign_key: 'user_id'
- belongs_to :category, foreign_key: 'category_id'


## likesテーブル
|Column|Type|Options|
|------|----|-------|
|post_idtle|integer|null, false|
|user_id|integer|null, false|
### Association

- belongs_to :user, foreign_key: 'user_id'