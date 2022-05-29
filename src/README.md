# ChordBoard
URL:https://chordboard.net/


作曲する際に、コード進行のアイデアを共有する掲示板形式のサイトです。


ログイン機能があるので、お気に入りの作曲者のアカウントや自分専用のメモ帳としても使えます。


また、再生ボタンをクリックすると音楽が再生するので、コーﾄﾞ進行をWEB上で確認できます。

---
**(テストユーザーでのログインは、**


* **email: test@example.com**


* **password: 123456)**
---

## インフラ構成図
![](./src/infrastructure.drawio.svg)

## 開発環境
* Windows11
* WSL2(ubuntu20.04.3)
* Git
* GitHub

## 使用技術
* Javascript
* Ruby 2.7.5
* Ruby on Rails 6.1.4.6
* MySQL 8.0
* Docker 20.10.11
* Docker-compose 3.0
* Rspec 5.0.3
* AWS
  * ECR/ECS/RDS/ALB/Route53


## 機能一覧
* ユーザー機能、ログイン機能(devise)
* 画像投稿機能(refile)
* 投稿機能
  * cookieを使った文字列取得・画面上に取得した文字列の表示・削除（cookieの振り直し）(Javascript)
  * 音声再生機能(audio-rails)
* フォロー機能
* いいね機能
* ページネーション機能(kaminari)(bootstrap)
* レスポンシブ対応(SASS)

## テスト
* Rspec
  * 単体テスト(model)
  * 機能テスト(request)
  * 統合テスト(system)
