# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nick_name          | string              | null: false               |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| family_name        | string              | null: false               |
| first_name         | string              | null: false               |
| family_name_kata   | string              | null: false               |
| first_name_kata    | string              | null: false               |
| birth_day︎          | date                | null: false               |

### Association

* has_many :items
* has_many :orders

## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| product_name                        | string     | null: false                    |
| product_information                 | text       | null: false                    |
| category︎_id                         | integer    | null: false                    |
| condition︎_id                        | integer    | null: false                    |
| price                               | integer    | null: false                    |
| shipping_cost︎_id                    | string     | null: false                    |
| shipping_origin︎_id                  | string     | null: false                    |
| shipping_date︎_id                    | string     | null: false                    |
| user                                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :orders
- has_one :buyer

## orders table

| Column                           | Type       | Options                        |
|----------------------------------|------------|--------------------------------|
| user                             | references | null: false, foreign_key: true |
| item                             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## buyers table

| Column            | Type       | Options                        |
|-------------------|------------|--------------------------------|
| prefecture︎_id     | integer    | null: false                    |
| city              | string     | null: false                    |
| building          | string     | null: true                    |
| telephone         | string     | null: false                    |
| item              | references | null: false, foreign_key: true |

### Association

- belongs_to :item