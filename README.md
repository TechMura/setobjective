# アプリ名：Habits

# 概要
目標を設定し、その目標を達成するためのメニューを曜日別にスケジューリングできるアプリです。</br>
トップページには、その日に行うメニューが表示されます。</br>
その表示されたメニューの横にはチェックボックスがあり、すべてにチェックが入ると</br>
「今日のやること達成！！お疲れ様でした！！」とポップが表示されます。

# 本番環境
https://setobjective.herokuapp.com/

ログイン情報(テスト用)
ID:testuser@test.com
PASS:testuser

# 制作背景(意図)
本やネットで知った良い習慣を取り入れれば、より良い毎日を過ごせます。<br>
しかし、生活に取り入れしようしても、なかなか長続きしないですぐに辞めてしまう経験が誰にもあると思います。<br>
そんな悩みを解消したいと思い、このアプリを作成しました。<br>
続かない原因は以下の通りだと考え、それらを解決できればと思います。<br>

* 続かない原因
  * 習慣を取り入れる目的が明確じゃない
  * 目的を忘れてしまう
  * 習慣にするメニューをいつやるか決めていない
  * 習慣にするメニューで得られる効果を忘れてしまう

# DEMO

# 工夫したポイント
* 使い方やデザインをシンプルにしたこと
* 目標・メニューを新規登録するは、ウィザード形式にして使いやすいしたこと
* メニューの追加では1画面で1週間のスケジュールを見ながら追加できるようにしたこと

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
