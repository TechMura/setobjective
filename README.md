
# アプリ名：Habits

# 概要
目標を設定し、その目標を達成するためのメニューを曜日別にスケジューリングできるアプリです。 </br>
トップページには、その日に行うメニューが表示されます。 </br>
その表示されたメニューの横にはチェックボックスがあり、すべてにチェックが入ると </br>
「今日のやること達成！！お疲れ様でした！！」とポップが表示されます。

# 本番環境
https://setobjective.herokuapp.com/

ログイン情報(テスト用) <br>
ID:testuser@test.com <br>
PASS:testuser <br>

# 制作背景(意図)
本やネットで知った良い習慣を取り入れれば、より良い毎日を過ごせます。<br>
しかし、生活に取り入れしようしても、なかなか長続きしないですぐに辞めてしまう経験が誰にもあると思います。<br>
そんな悩みを解消したいと思い、このアプリを作成しました。<br>
続かない原因は以下の通りだと考え、それらを解決できればと思います。<br>

* 続かない原因
  * 習慣を取り入れる目的が明確じゃないこと
  * 目的を忘れてしまうこと
  * 習慣にするメニューをいつやるか決めていないこと
  * 習慣にするメニューで得られる効果を忘れてしまうこと

# DEMO
## トップページ
![top_achieve](https://user-images.githubusercontent.com/71863912/110754863-a1b52380-828b-11eb-9d10-72d5f824ce15.gif)
* 設定中の目標とその日のメニューが表示されます
* 目標の文章が長かった場合は、スクロールして確認できます
* チェックが入るとポップが表示されます

## 目標設定
![set_objective](https://user-images.githubusercontent.com/71863912/110753289-c01a1f80-8289-11eb-9205-5ebb5c85169a.gif)
* ヘッダーの「目標一覧」クリックして、「新しい目標を追加する」から目標設定することができます。
* 各項目を入力し、次へをクリックするとメニュー設定画面に遷移する
* 「今の目標に設定するならチェック」にチェックを入れて登録することで、トップページに表示される目標・メニューを設定できます
* 「次へ」をクリックすると、メニュー追加画面へ遷移します

## メニュー設定
* 

# 工夫したポイント
* 使い方やデザインをシンプルにしたこと
* 目標・メニューを新規登録する際は、ウィザード形式にして使いやすくしたこと
* メニューの追加では1画面で1週間のスケジュールを見ながら追加できるようにしたこと

# 使用技術(開発環境)

## バックエンド
Ruby, Ruby on Rails

## フロントエンド
html, css, JavaScript, Ajax

## データベース
MySQL, SequelPro

## インフラ
Heroku

## ソース管理
GitHub, GitHubDesktop 

## テスト
RSpec

## エディタ
VSCode

# 課題や今後実装したい機能
* レシポンシブデザインを作成
* メニューの追加・削除を一画面でできるよう実装
* 他ユーザーの目標・メニュー閲覧機能を実装
* 日記機能を実装

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
