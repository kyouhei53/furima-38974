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
| birthday_id         | integer | null: false              |

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
| prefectures_id      |  integer  | null: false                      |
| send_id             |  integer  | null: false                      |
| price               |  integer  | null: false                      |
| user                | references| null: false  ,foreign_key: true  | 


### Association

- belongs_to: user
- has_one: buy

# buysテーブル


| Column              | Type       | Options                        |   
| --------------------|------------|--------------------------------|
| item                | reference  | null: false, foreign_key: true |
| user                | reference  | null: false, foreign_key: true |


### Association

- belongs_to: user
- belongs_to: item
- has_one: address

# addresssテーブル


| Column              | Type    | Options               |
| --------------------|---------|-----------------------|
| postal_code         | integer | null: false           |
| prefectures         | string  | null: false           |
| city                | string  | null: false           |
| house_number        | string  | null: false           |
| building_name       | string  |                       |
| tel_number          | integer | null: false           |


### Association

- belongs_to: buy