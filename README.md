# usersテーブル

| Column              | Type    | Options                  |
| --------------------|---------|--------------------------|
| email               | string  | null: false, unique: true|
| encrypted_password  | string  | null: false              |
| nickname            | string  | null: false              |
| last_name           | string  | null: false              |
| first_name          | string  | null: false              |
| last_name_kana      | string  | null: false              |
| first_name_kana     | string  | null: false              | 
| birthday            | date    | null: false              |

### Association

- has_many: items
- has_many: buys



# itemsテーブル

| Column              | Type      | Options                          |
| --------------------|-----------|----------------------------------|
| title               |   string  | null: false                      |
| explanation         |   text    | null: false                      |
| category_id         |  integer  | null: false                      |
| situation_id        |  integer  | null: false                      |
| delivery_id         |  integer  | null: false                      |
| prefecture_id       |  integer  | null: false                      |
| shipping_id         |  integer  | null: false                      |
| price               |  integer  | null: false                      |
| user                | references| null: false  ,foreign_key: true  | 


### Association

- belongs_to: user
- has_many: buy

# buysテーブル


| Column              | Type       | Options                        |   
| --------------------|------------|--------------------------------|
| item                | references | null: false, foreign_key: true |
| user                | references | null: false, foreign_key: true |


### Association

- belongs_to: user
- belongs_to: item
- has_one: address

# addresssテーブル


| Column              | Type     | Options                           |
| --------------------|----------|-----------------------------------|
| postal_code         | string   | null: false                       |
| prefecture_id       | integer  | null: false                       |
| city                | string   | null: false                       |
| house_number        | string   | null: false                       |
| building_name       | string   |                                   |
| tel_number          | string   | null: false                       |
| buy                 |references| null: false,foreign_key: true     |    


### Association

- belongs_to: buy