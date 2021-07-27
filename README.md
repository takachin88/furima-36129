## users テーブル

| Column              | Type    | Options                  |
| ------------------- | ------  | ------------------------ |
| nick_name           | string  | null: false              |
| email               | string  | null: false unique: true |
| encrypted_password  | string  | null: false              |
| first_name          | string  | null: false              |
| last_name           | string  | null: false              |
| first_name_katakana | string  | null: false              |
| last_name_katakana  | string  | null: false              |
| birth_day           | date    | null: false              |
### Association
* has_many :items
* has_many :buyers
* has_many :ships

## items テーブル

| Colum                 | Type       | Options           |
| --------------------  | ---------- | ----------------- |
| user                  | references | foreign_key: true |
| item_name             | string     | null: false       |
| item_explanation      | text       | null: false       |
| category_id           | integer    | null: false       |
| item_status_id        | integer    | null: false       |
| shipping_charges_id   | integer    | null: false       |
| shipping_area_id      | integer    | null: false       |
| days_to_ship_id       | integer    | null: false       |
| price                 | integer    | null: false       |
### Association
* belongs_to :items
* belongs_to :buyers
* has_one :ships

## buyers テーブル

| Colum              | Type       | Options           |
| ------------------ | ---------  | ----------------- |
| user               | references | foreign_key: true |
| item               | references | foreign_key: true |
### Association
* belongs_to :user
* has_many :items
* has_many :ships

## ships テーブル

| Colum              | Type       | Options           |
| ------------------ | ---------  | ----------------- |
| post_code          | string     | null: false       |
| prefecture         | integer    | null: false       |
| city               | string     | null: false       |
| address            | string     | null: false       |
| building_name      | string     | string            |
| phone_number       | integer    | null: false       |
| buyer              | references | foreign_key: true |
### Association
* belongs_to :ships
* belongs_to :users
* belongs_to :buyers