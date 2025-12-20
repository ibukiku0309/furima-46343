# テーブル設計

## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| lastname           | string | null: false |
| firstname          | string | null: false |
| lastnamekana       | string | null: false |
| firstnamekana      | string | null: false |
| birthday           | date   | null: false |

### Association
- has_many :items
- has_many :records


## itemsテーブル

| Column             | Type       | Options     |
| ------------------ | ------     | ----------- |
| image              | text       | null: false |
| title              | string     | null: false |
| content            | text       | null: false |
| category           | string     | null: false |
| condition          | string     | null: false |
| fee                | integer    | null: false |
| region             | string     | null: false |
| day                | integer    | null: false |
| price              | integer    | null: false |
| user_id            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :record

## recordsテーブル
| Column             | Type       | Options     |
| ------------------ | ------     | ----------- |
| user_id            | references | null: false, foreign_key: true |
| item_id            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :address


## addressesテーブル

| Column             | Type       | Options     |
| ------------------ | ------     | ----------- |
| address            | string     | null: false |
| postcode           | integer    | null: false |
| prefectures        | string     | null: false |
| municipalities     | string     | null: false |
| streetaddress      | string     | null: false |
| building           | string     | null: false |
| phonenumber        | integer    | null: false |
| record_id          | references | null: false, foreign_key: true |

### Association
- belongs_to :record