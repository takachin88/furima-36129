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

## items テーブル

| Colum                 | Type       | Options           |
| --------------------  | ---------- | ----------------- |
| user                  | references | foreign_key: true |
| item_name             | string     | null: false       |
| explanation           | text       | null: false       |
| category_id           | integer    | null: false       |
| item_status_id        | integer    | null: false       |
| shipping_charge_id    | integer    | null: false       |
| shipping_area_id      | integer    | null: false       |
| days_to_ship_id       | integer    | null: false       |
| price                 | integer    | null: false       |
### Association
* belongs_to :user
* has_one :buyer

## buyers テーブル

| Colum              | Type       | Options           |
| ------------------ | ---------  | ----------------- |
| user               | references | foreign_key: true |
| item               | references | foreign_key: true |
### Association
* belongs_to :user
* belongs_to :item
* has_one :ship

## ships テーブル

| Colum              | Type       | Options           |
| ------------------ | ---------  | ----------------- |
| post_code          | string     | null: false       |
| shipping_area_id   | integer    | null: false       |
| city               | string     | null: false       |
| address            | string     | null: false       |
| building_name      | string     |                   |
| phone_number       | string     | null: false       |
| buyer              | references | foreign_key: true |
### Association
* belongs_to :buyer