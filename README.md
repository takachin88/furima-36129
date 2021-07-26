## users テーブル

| Column              | Type    | Options     |
| ------------------- | ------  | ----------- |
| nick_name           | string  | null: false |
| email               | string  | null: false |
| encrypted_password  | string  | null: false |
| first_name          | string  | null: false |
| last_name           | string  | null: false |
| first_name_katakana | string  | null: false |
| last_name_katakana  | string  | null: false |
| birth_day_id        | integer | null: false |

## items テーブル

| Colum                 | Type       | Options     |
| --------------------  | ---------- | ----------- |
| user                  | references |             |
| item_name             | text       | null: false |
| item_explanation      | text       | null: false |
| category_id           | integer    | null: false |
| item_status_id        | integer    | null: false |
| shipping_charges_id   | integer    | null: false |
| shipping_area_id      | integer    | null: false |
| days_to_ship_id       | integer    | null: false |
| price                 | integer    | null: false |

## buyers テーブル

| Colum              | Type       | Options     |
| ------------------ | ---------  | ----------- |
| user               | references | null: false |
| item               | references | null: false |

## ships テーブル

| Colum              | Type       | Options     |
| ------------------ | ---------  | ----------- |
| post_code          | string     | null: false |
| prefecture         | integer    | null: false |
| city               | string     | null: false |
| address            | string     | null: false |
| building_name      | string     | null: false |
| phone_number       | integer    | null: false |
| buyer              | references | null: false |