# アプリ名：Habits

# 概要
目標を設定し、その目標を達成するためのメニューを曜日別にスケジューリングできるアプリです。</br>
トップページには、その日に行うメニューが表示されます。</br>
その表示されたメニューの横にはチェックボックスがあり、すべてにチェックが入ると</br>
「今日のやること達成！！お疲れ様でした！！」とポップが表示されます。

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

| Column        | Type       | Options                             |
| ------------- | ---------- | ----------------------------------- |
| todo          | string     | null:      false                    |
| time          | integer    | null:      true                     |
| effect        | text       | null:      true                     |
| day_week_id   | integer    | null:      false                    |
| achieve_flag  | boolean    | default:   false                    |
| target        | references | null:      false,foreign_key: true  |

### Association
-belongs_to :target
