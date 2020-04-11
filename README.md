# README

# 「男飯」取り扱い説明書
<img width="1440" alt="top" src="https://user-images.githubusercontent.com/58877984/79036087-90891000-7bff-11ea-9721-7098e0e39e89.png">
<p>&nbsp</p>
<p>&nbsp</p>

# 制作した経緯
私自身、「今日のご飯は超簡単に済ませたい！」と考え料理投稿アプリを検索するも、「白だし」や「オイスターソース」など家に置いていない調味料に
ヒットすることが多く、白だしは何で代用するんだろう...と結局検索する為に時間を費やすと言うことが多々ありました。
<br>
そんなときに「基本調味料しか使わない超簡単料理ばかりが載ったアプリがあればいいのにな」と考えたことが、このアプリを作るキッカケとなりました。
<p>&nbsp</p>
<p>&nbsp</p>

# 使用言語、フレームワーク、データベース
- haml&Sass
- JavaScript
- jQuery
- Ruby
- Ruby on Rails
- MySOL
- AWS
<p>&nbsp</p>
<p>&nbsp</p>

# このアプリでできること
- ユーザー登録(Google認証機能付き)
- マイページ表示
- 料理一覧、詳細表示
- カテゴリ別料理一覧検索
- キーワード別料理一覧検索
- 料理投稿
- 投稿編集、削除
- いいね機能
- レスポンシブル対応

## ユーザー登録（Google認証機能つき）
<img width="1440" alt="48b91868fb63cedc029b06c622344aef" src="https://user-images.githubusercontent.com/58877984/79039888-68a9a480-7c1f-11ea-8b78-6f383e46689b.png">
gemファイル「devise」を導入しユーザーネーム、メールアドレス、パスワードにてユーザー登録を実現しています。
また、gemファイル「omniauth-google-oauth2」及び「omniauth-rails_csrf_protection」を導入して
Googleアカウントによる認証機能も設定しています。
<p>&nbsp</p>

## マイページ表示
![1240141cd184f0b666c8dafe1be4f8ae](https://user-images.githubusercontent.com/58877984/79036349-80befb00-7c02-11ea-8369-aed37323cb63.jpg)
マイページではユーザー情報編集（ユーザーネーム、パスワード）が可能となっており、
自身が投稿した料理の一覧が表示されます。
<p>&nbsp</p>

## 料理一覧、詳細表示、いいね機能
![e0432cf6a0c31a3102dc6f6166c94407](https://user-images.githubusercontent.com/58877984/79036411-f3c87180-7c02-11ea-986d-69f0deb10c82.jpg)
トップページには全てのユーザーが投稿した記事を一覧で表示しています。
また、検索フォームによる料理検索や、一覧表示したい記事のカテゴリ選択が可能です。
<p>&nbsp</p>

![32dc4d5d66ce15be4b6a47c51af517d6](https://user-images.githubusercontent.com/58877984/79036407-ef03bd80-7c02-11ea-89f7-514aadb352d5.jpg)
投稿の詳細画面には上から順に投稿したユーザー名、料理を投稿する際に入力したタイトル、カテゴリ、材料、レシピが表示されます。
また、「いいね！」機能としてLGTM機能を実装しています。LGTMに関してはpostテーブルと紐付けしたlikesテーブルに存在する投稿のレコードに
カウントが蓄積されます。
<p>&nbsp</p>

## カテゴリ別料理一覧検索
<img width="1440" alt="75fa85d0813db974ad363c6db1bbe707" src="https://user-images.githubusercontent.com/58877984/79036567-45bdc700-7c04-11ea-86ca-6dce933669fc.png">
トップページにて選択されたカテゴリに属している記事が一覧で表示されます。
<p>&nbsp</p>

## キーワード別料理一覧検索
![931dd70516f04427fd57d5d25d324b7a](https://user-images.githubusercontent.com/58877984/79036526-e65fb700-7c03-11ea-805a-0938d8c67e20.jpg)
検索フォームにて入力されたキーワードに対し、タイトル、材料、レシピの本文中に対象キーワードが存在する記事が一覧で表示されます。
あいまい検索にも対応している為、一部キーワードが含まれていれば表示される機能を設定しています。
<p>&nbsp</p>

## 料理投稿
<img width="1440" alt="890c287902d75d41df15679bec3ed3c2" src="https://user-images.githubusercontent.com/58877984/79036609-d1cfee80-7c04-11ea-897b-27764e41ce09.png">
タイトル、材料、レシピを入力し、カテゴリと画像を選択して投稿します。料理投稿アプリのため、どの項目が一つでも抜けると
投稿できないようにバリデーションをかけています。
カテゴリにはgemファイル「ancestry」を導入し、画像もプレビュー表示できるようにJSを仕込んでいます。
<p>&nbsp</p>

## 投稿編集、削除
![b248e6466e0463322d1ef832f05d5d31](https://user-images.githubusercontent.com/58877984/79036633-35f2b280-7c05-11ea-93fd-de3997d3bf8c.jpg)
自身が投稿した記事の詳細画面には「編集」「削除」ボタンが表示されるようになっています。編集ページは先ほどの投稿ページと同じビューを採用し、
更新ボタンを押すと内容が上書きされるように設定しています。
削除については、削除ボタンを押すと投稿から削除できるように設定しています。
<p>&nbsp</p>

## レスポンシブ対応
<img width="649" alt="551316207e5c177a10f6bc0d20448674" src="https://user-images.githubusercontent.com/58877984/79036698-d21cb980-7c05-11ea-8796-2dd6a388b6fa.png">
スマホ、タブレットユーザー向けにレスポンシブ対応しており、ヘッダーのメニューがドロップダウンになるよう設定しています。
<p>&nbsp</p>
<img width="647" alt="72451de52f3114b40b60ce547e39e89e" src="https://user-images.githubusercontent.com/58877984/79036696-cfba5f80-7c05-11ea-9a46-f865ba830c1c.png">
ハンバーガーメニューをクリックすると、画面全体にドロップダウンメニューが広がってくるよう設定しています。
<p>&nbsp</p>
<p>&nbsp</p>

# 今後のアップデート予定
今後は以下の点を実装し、より拘りを持ったアプリケーションにしていきたいと考えています。
<br>
- 普段あまり使わない調味料は登録できないNGワード機能を設定し、超簡単飯のコンセプトに磨きをかける
- 自分がいいねした記事を一覧で表示できるようにする
- 複数枚の画像投稿機能を設定し、よりレシピを細かく見られるようにする
<p>&nbsp</p>

# 参考 DB設計
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
