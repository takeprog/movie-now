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
