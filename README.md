
# 実行手順

## 必要要件
- Git
- Docker

## Dockerイメージのビルド

```bash
$ git clone https://github.com/kintone/cli-kintone
$ docker build --rm -t cli-kintone:0.9.4 .
```

## cli-kintoneの実行

```bash
$ docker run --rm cli-kintone:0.9.4
```

# メモ
- cli-kintoneのバイナリファイルをbinへコピーする
    ```bash
    $ docker run --rm -v $(pwd)/bin:/tmp/dummy --entrypoint="cp" cli-kintone:0.9.4 -p cli-kintone /tmp/dummy/cli-kintone
    ```

- CSVファイル出力
    ```bash
    $ docker run --rm cli-kintone:0.9.4 -a [アプリID] -d [サブドメイン名] -t [APIトークン] > output.csv
    ```
