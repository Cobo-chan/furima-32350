# テーブル設計

## usersテーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| last_name_kana     | string  | null: false               |
| birthday           | date    | null: false               |

### Association

has_many :items
has_many :orders

## itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| item_text          | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| prefectures_id     | integer    | null: false                    |
| shipment_source_id | integer    | null: false                    |
| selling_price      | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

belongs_to :user
has_one :order

## ordersテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item
has_one :street_addresses

## Street_addressesテーブル

| Column           | Type       | Options                  |
| ---------------- | ---------- | ------------------------ |
| postcode         | string     | null: false              |
| prefectures_id   | string     | null: false              |
| municipality     | string     | null: false              |
| address          | string     | null: false              |
| optional_address | string     |                          |
| phone_number     | string     | null: false              |
| order            | references | null: false, foreign_key |

### Association

belongs_to :order