# usersテーブル

| Column              | Type    | Options               |
| --------------------|---------|-----------------------|
| email               | string  | NOT NULL ,ユニーク制約  |
| encrypted_password  | string  | NOT NULL              |
| name                | string  | NOT NULL              |

### Association

- has_many: items
- has_many: buys


# itemsテーブル

| Column              | Type      | Options             |
| --------------------|-----------|---------------------|
| title               |   string  | NOT NULL            |
| explanation         |   text    | NOT NULL            |
| category_id         |   string  | NOT NULL            |
| situation_id        |   string  | NOT NULL            |
| delivery_id         |   string  | NOT NULL            |
| price               |  integer  | NOT NULL            |
| user                | references| NOT NULL , 外部キー  | 


### Association

- belongs_to: user
- has_one: buy

# buysテーブル


| Column              | Type       | Options
| --------------------|------------|---------------------
| items               | reference  | NOT NULL, 外部キー
| user                | reference  | NOT NULL, 外部キー


### Association

- belongs_to: user
- belongs_to: item
- has_one: address

# addressテーブル


| Column              | Type    | Options               |
| --------------------|---------|-----------------------|
| postal_code         | string  | NOT NULL              |
| prefectures         | string  | NOT NULL              |
| city                | string  | NOT NULL              |
| house_number        | string  | NOT NULL              |
| building_name       | string  |                       |
| user                |reference| NOT NULL,外部キー      |


### Association

- belongs_to: buy