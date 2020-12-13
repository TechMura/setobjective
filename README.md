# テーブル設計

## users テーブル

| Column    | Type    | Options                     |
| --------- | ------- | --------------------------  |
| nickname  | string  | null:  false, unique: true   |
| email     | string  | null:  false, unique: true   |
| password  | string  | null:  false                 |

### Association
- has_many :objectives


## objectives テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| declaration  | string     | null:  false                   |
| reason       | text       | null:  false                   |
| reward       | text       | null:  false                   |
| set_flag     | boolean    | default: false                 |
| user         | references | null:  false,foreign_key: true |

### Association
-belongs_to :user
-has_many :menus


## menusテーブル

| Column      | Type       | Options                         |
| ----------- | ---------- | ------------------------------- |
| todo        | string     | null:  false                    |
| time        | integer    | null:  true                     |
| effect      | text       | null:  true                     |
| day_week_id | integer    | null:  false                    |
| target      | references | null:  false,foreign_key: true  |

### Association
-belongs_to :target