# アプリケーション名
 ## 「movie now」
# アプリケーション概要
  ユーザーに合った映画を探せるアプリケーションです

  ## 探すための機能
  - 複数のタグから検索
  - ランキング
  - 作品へのコメント
  - 「いいね」機能
  - 最新追加作品一覧

# URL
  https://movie-now00.herokuapp.com/
# テスト用アカウント
  ### 管理者アカウト 
   - メールアドレス：admin@admin
   - パスワード：admin00
  ### 通常アカウント
   - メールアドレス：taro@taro
   - パスワード：taro00

# 利用方法
 ## 作品追加の流れ
  - 管理者IDでログインしてください
  -  トップページの一番下の「管理者画面」というリンクを押して下さい→「映画名」、タグを入力して下さい（空欄のタグ欄あっても保存可能です）→「作品追加」ボタンを押して下さい
  ## タグ検索の流れ
  - ログイン状態にして下さい
  - 複数のタグを選んで下さい（何個でも可能です）→「検索開始」ボタンを押して下さい
  ## コメント機能
  - ログイン状態にしてください
  - 作品名を押してください（トップ画面、検索結果画面）→投稿フォームでコメント入力とジャンルを選んでください→「投稿」ボタンを押してください→それぞれのジャンルの欄にコメントが分けて表示されます
  ## いいね機能
  - ログイン状態にしてください
  - 作品名を押してください（トップ画面、検索結果画面）→「いいね」ボタンを押して下さい（ボタンが赤に変わります）→もう一度「いいね」を押して下さい（元の白に戻ります）  
    ※「いいね」を押すと  
     ボタン右横でいいね数がカウントされます  
     トップページのランキングに反映されます  
     マイページに「いいね」した作品が保存されます
    
# 目指した課題
  ## ペルソナ
   - 映画を月2本以上観る映画好きな人
   - 多くのジャンルを観る人
  ## 課題
   - 多くのジャンルを観る人はその時の気分によって観たい映画の傾向が変わります。その為配信サイト等のおすすめ機能があまり参考になりません
   - 多くのサイトでは検索する際にジャンルだけ等、条件を1つしか指定出来ないものが多いです
  ## ユーザーストーリー
   - 複数の条件からその時の気分に合った作品を探せる機能です


# 要件定義


| 優先順位  | 機能           | 目的                            |詳細    |ストーリー（ユースケース）  |見積もり（所要時間）  | 
| -------  | ------------- | -------------------------     | ------ | --------------------- | ----------------- |
| 3       | タグ検索機能    | ・その人のその時の気分に合った映画を探す | ・複数のタグを選択肢から選択し検索すると、全てが含まれる映画が表示される | ・複数の映画が投稿されていることが前提<br>・追加された作品の全てのタグが表示される<br>・タグは項目毎に分けて表示する<br>・タグの項目に関係なく複数選択可能にする<br>・全てのタグ条件が一致するものを別ページに表示する | 8 |
| 4       | いいね機能      | ・その映画への注目度を可視化する<br>・マイページへ保存する | ・「いいね」ボタンを押すことで、その数を作品毎に表示、トップ画面のランキングに反映することで、注目度を可視化する<br>・映画をいいねリストとしてマイページに保存出来る | ・映画が投稿されているのが前提<br>・映画の詳細ページに「いいね」ボタンを設ける<br>・ボタンを押すとDBに保存され、ボタンの色が変わる<br>・色が変わっている状態のボタンを押すと、DBから削除され色が最初の白に戻る<br>・色が変わっている状態だと、マイページにその映画が表示される | 5 |
| 5       | コメント機能    | ・ユーザーの映画選択する際の判断材料を増やす | ・作品毎の作品詳細画面でコメント欄を実装する<br>・コメント表示をジャンル毎に分ける | ・映画が投稿されているのが前提<br>・映画詳細画面でコメント、コメントジャンルを入力することで投稿出来る<br>・コメントジャンルによってコメント表示場所を分ける | 3 | 
| 1       | ユーザー登録機能 | ・ログイン機能によりマイページを活用する<br>・管理者と通常ユーザーの区別をする | ・ユーザー機能を実装することで、各ユーザーのお気に入り作品の管理をする<br>・管理者と通常ユーザーを区別する | ・ログアウト状態では新規登録、ログインのリンクが表示される<br>・ログイン時はログアウト、マイページへのリンクが表示される<br>・管理者IDの場合は管理者リンクが表示される | 3 |
| 2       |  作品追加機能   | 選択可能な映画の種類を随時更新出来るようにする | ・管理者画面から追加映画を投稿することで、ユーザーが観覧できる映画の種類を増やす<br>・映画にタグ付けをする | ・管理者IDでログインしているのが前提<br>・「映画名」「タグ」の入力欄を設ける<br>・タグは項目毎に区別出来るようにする<br>・タグを追加する際の個数制限は設けない<br>・追加ボタンを押すことで全てのデータがDBに保存される | 8 |
| 6       |  ランキング機能 | ユーザーが映画選択する際の判断材料を増やす | ・「いいね」を押された回数を元にランキングを表示する | ・映画が投稿されているのが前提<br>・「いいね」ボタンが押されているのが前提<br>・「いいね」が押された数に応じた上位5作品のランキンを表示する | 1 |







# 実装内容
 ## トップページ概要
 [![Image from Gyazo](https://i.gyazo.com/dea3312c72345184adbad46c5a3bb79f.gif)](https://gyazo.com/dea3312c72345184adbad46c5a3bb79f)
- ログアウト時、ヘッダーにはログイン、新規登録のリンクが表示されます。ログイン時はマイページ、ログアウトのリンクが表示されます
- ヘッダーには管理者IDでログインしているときのみ管理者リンクが表示されます
- 各ページの映画画像はAPIを使用し、映画名から検索しています
- APIで該当作品がなかった場合は「画像はありません」と表示されます
 

 ## タグ検索機能
 [![Image from Gyazo](https://i.gyazo.com/0a4c2cd46296344c4bd31ba4aa26ae8c.gif)](https://gyazo.com/0a4c2cd46296344c4bd31ba4aa26ae8c)
- タグは項目毎に分けて表示されています
- タグ選択欄から項目に関係なく複数選ぶことが出来ます
- 検索ボタンを押すと全ての条件が該当する検索結果が表示されます
- トップページと検索結果画面のみログアウト状態で使用可能です

 ## 映画追加機能（管理者のみ使用可能）
 [![Image from Gyazo](https://i.gyazo.com/6570b208675aa27985c9edb0bfcc1880.gif)](https://gyazo.com/6570b208675aa27985c9edb0bfcc1880)
 - 管理者IDでログイン時にトップページのヘッダーに管理者リンクが表示されます
 - 管理者以外のユーザーがURLを入力し直接映画追加ページに移動しようとすると、トップページに移動します
 - 映画名入力は必須で、 タグに関しては各項目空欄または複数入力することが出来ます
 - タグ間に「,」をつけることで同欄に複数のタグを入力することが出来ます
 - タグは1度の送信で項目関係なく全て別のレコードに保存されます

 ## いいね機能、コメント機能
 [![Image from Gyazo](https://i.gyazo.com/11e6036a0bd43bbbebe9161eee1e022e.gif)](https://gyazo.com/11e6036a0bd43bbbebe9161eee1e022e)
 - ログインしているユーザーのみ詳細ページに移動することが出来ます
 - 映画詳細ページに記載されている映画概要はAPIを使用し、映画名から検索しています
 - 管理者IDでログインして映画詳細ページに移動した時のみ削除ボタンが表示されます
 ### いいね機能
 - ログインしているユーザーのみ使用出来ます
- 「いいね」を1度押すと白が赤に変わり、もう1度押すと白に戻ります
- 白のボタンを押すとテーブルに情報が保存され、赤のボタンを押すと情報が削除されます
- その作品の「いいね」数はボタンの右側にカウント表示されています
### コメント機能
- JavaScriptを用いた非同期通信です
- ログインしているユーザーのみ使用出来ます
- 投稿フォームのコメントとコメントジャンルを選び投稿ボタンを押すことで投稿することが出来ます
- 投稿された内容は投稿ジャンル毎に分けて表示されます      

 ## マイページ、ランキング、新規追加映画一覧
 [![Image from Gyazo](https://i.gyazo.com/7e170de80e4d447ac6ca464030facf68.gif)](https://gyazo.com/7e170de80e4d447ac6ca464030facf68)
### マイページ
- ログインしているユーザーとマイページのユーザーが一致するときのみ表示されます
- URLを入力し他のユーザーのページに直接移動しようとするとトップページに移動します
- マイページには自分が「いいね」した映画一覧が表示されます

### ランキング、新規投稿映画一覧
- 新規投稿一覧は左から新しい追加映画順に5作品並んでいます
- ランキングは「いいね」数を元に、左から多い順に5作品並んでいます


# 工夫ポイント
  - タグを種類別に分けて保存すると共に、タグの種類にかかわらず1度の投稿で各タグを全て別のレコードに保存できるように工夫しました
  - コメントを「good」「bad」「その他」でジャンル分けして、それぞれの表示場所を分けることで、ユーザーの可読性を高められるよう工夫しました
  - 検索機能ではRansackでscopeを使うことで、checkboxで選択された内容を全て含むもののみ検索出来るようにしました

# 使用技術
HTML・CSS・Ruby・Ruby on Rails・JavaScript・SQL・Git・ GitHub 等

# 実装予定機能
  - タグを押した際にリアルタイムで該当数が表示される機能を実装します
  - 「いいね」機能を非同期通信にします
  - ユーザー入力式の検索機能を実装します
  - レスポンシブWebデザインを実装します


# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many :likes
- has_many :liked_movies, through: :likes, source::movie

## movies テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| movie_name        | string     | null: false                    |

### Association

- has_many :likes
- has_many :liked_users, through: :likes, source::user
- has_many :tag_maps
- has_many :tags, through::tag_maps

## tags テーブル

| Column                | Type       | Options |
| --------------------- | ---------- | ------- |
| actor_tag             | string     |         |
| genre_tag             | string     |         |
| distribution_site_tag | string     |         |
| other_tag             | string     |         |

### Association

- has_many :tag_maps
- has_many :movies, through: :tag_maps

## likes テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| movie            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :movie

## tag_maps テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| movie  | references | null: false, foreign_key: true | 
| tag    | references | null: false, foreign_key: true |

### Association

- belongs_to :movie
- belongs_to :tag
