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
| shipping_cost︎_id                    | integer    | null: false                    |
| prefecture︎_id                       | integer    | null: false                    |
| shipping_date︎_id                    | integer    | null: false                    |
| price                               | integer    | null: false                    |
| user                                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders table

| Column                           | Type       | Options                        |
|----------------------------------|------------|--------------------------------|
| user                             | references | null: false, foreign_key: true |
| item                             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :buyer

## buyers table

| Column            | Type       | Options                        |
|-------------------|------------|--------------------------------|
| post code         | integer    | null: false                    |
| prefecture︎_id     | integer    | null: false                    |
| city              | string     | null: false                    |
| street_address    | string     | null: false                    |
| building          | string     |                                |
| telephone         | string     | null: false                    |
| order             | references | null: false, foreign_key: true |

### Association

- belongs_to :order