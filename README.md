# テーブル設計

## usersテーブル

| Column         | Type    | Options                   |
| -------------- | ------- | ------------------------- |
| nickname       | string  | null: false               |
| email          | string  | null: false, unique: true |
| password       | string  | null: false               |
| last_name      | string  | null: false               |
| first_name     | string  | null: false               |
| last_name_kana | string  | null: false               |
| last_name_kana | string  | null: false               |
| phone_number   | integer | null: false               |

### Association

has_many :items
has_many :orders

## itemsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_name       | string     | null: false                    |
| item_text       | string     | null: false                    |
| category        | string     | null: false                    |
| condition       | string     | null: false                    |
| delivery_charge | string     | null: false                    |
| shipment_source | string     | null: false                    |
| selling_price   | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

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
| postcode         | integer    | null: false              |
| prefectures      | string     | null: false              |
| municipality     | string     | null: false              |
| address          | string     | null: false              |
| optional_address | string     | null: false              |
| phone_number     | integer    | null: false              |
| order            | references | null: false, foreign_key |

### Association

belongs_to :order