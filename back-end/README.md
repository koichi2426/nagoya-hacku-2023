# Back-End
OpenHack2023 nagoyaで使用するWebアプリケーションのバックエンド開発用ディレクトリ

## 環境
Docker compose環境を利用し、バージョンを合わせて開発をする
使用フレームワークはruby on railsを利用し、apiモードで動作を想定
DBにはsqliteを利用しローカルにデータを保存する

## 動作
chat gpt api への問い合わせとjson形式でのデータのやりとりをする
DBとの通信をし、目標の個数や目標データ、小目標の進捗度合をあらわすデータが必要
