# 開発環境

## 必要なツール

Docker for Mac / Windows

## セットアップ

```sh
$ docker-compose build
$ commands/setup.sh
```

## 実行

```sh
$ docker-compose up web
```

http://localhost:5000

### 稼働中のコンテナのシェルに接続

```sh
$ docker-compose exec web bash
```

## パッケージマネージャ操作（例）

`mix deps.get`

```sh
$ commands/mix.sh deps.get
```

`npm install`

```sh
$ commands/npm.sh install
```
