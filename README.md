# アプリ名
Dancers Joint

# 概要
ユーザー登録（フルネーム、ニックネーム、Email、パスワード）することで利用可能になる

利用できる項目は情報交換ができる掲示板（投稿・編集・検索）

# 制作背景
私は３歳からクラシックバレエ、小学５年生から大学卒業までストリートダンスを習っていました。
自身の経験からダンサー業界では仕事や収入につなげることが難しいと感じたことがある為、このアプリケーションを作ることにしました。
ダンサー業界で仕事を獲得する課題としては以下が挙げられると考えます。
- 自分を知ってもらうこと
- 人との繋がりがあること

上記の課題を解決するためにはオンライン上でコミュニケーションが取れる場が必要なのではないかと考えました。
そこで、コミュニケーション型のオンラインサロンの設立を実装しました。
オンラインサロン型にした理由としては、定額制を設けることにより運営側が管理し、より正確で有益な情報を流すことができると考えたからです。
有名なダンサーや、オーガナイザーとの繋がりを運営側で作り、ダンサーと繋げることでイベント出演や仕事へと繋げることが目標です。


# 実装予定の内容
- 定額制機能の実装
- より見やすい掲示板へのアップデート

# キャプチャ画像
[![Image from Gyazo](https://i.gyazo.com/716aaddb09a04a36840cb63b360c2e32.gif)](https://gyazo.com/716aaddb09a04a36840cb63b360c2e32)

# テーブル設計

## usersテーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :topics
- has_many :posts


## topicsテーブル

| Column      | Type    | Options                        |
| ----------- | ------- | ------------------------------ |
| title       | string  | null: false                    |
| user_id     | integer | null: false, foreign_key: true |
| category_id | integer | null: false                    |

### Association

- has_many :posts
- belongs_to :user
- belongs_to_active_hash :category


## postsテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| body     | text       | null: false                    |
| user_id  | integer    | null: false, foreign_key: true |
| topic_id | integer    | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :topic



