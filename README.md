# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nik_name           | string              | null: false               |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| family_name        | string              | null: false               |
| first_name         | string              | null: false               |
| family_name_kata   | string              | null: false               |
| first_name_kata    | string              | null: false               |
| birth_year         | integer             | null: false               |
| birth_month        | integer             | null: false               |
| birth_day          | integer             | null: false               |

### Association

* has_many :items
* has_many :users_items

## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| product_name                        | string     | null: false                    |
| category                            | integer    | null: false                    |
| condition                           | integer    | null: false                    |
| user_id                             | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_many :users_items
- has_one :buyer

## users_items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| user_id                             | references | null: false, foreign_key: true |
| item_id                             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## buyers table

| Column            | Type       | Options                        |
|-------------------|------------|--------------------------------|
| prefecture        | integer    | null: false                    |
| city              | string     | null: false                    |
| building          | string     | null: false                    |
| telephone         | string     | null: false                    |
| item_id           | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one :shipment

## shipments table

| Column            | Type       | Options                        |
|-------------------|------------|--------------------------------|
| shipping_cost     | string     | null: false                    |
| shipping_origin   | string     | null: false                    |
| shipping_date     | string     | null: false                    |
| buyer_id          | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer