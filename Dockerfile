#======================================
# Build環境
#======================================
# ビルド環境を用意
FROM golang:1.9.3 AS build-container

# 環境変数定義
ENV GOPATH=/opt/cli
ENV APP_HOME=$GOPATH/src/cli-kintone

# cli-kintoneのCLIディレクトを作成、および作業ディレクトリに指定
RUN mkdir -p $APP_HOME
ADD ./cli-kintone $APP_HOME
WORKDIR $APP_HOME

# Go言語のパッケージGomをインストール
RUN go get github.com/mattn/gom
RUN ln -s $GOPATH/bin/gom /usr/local/bin/gom
RUN gom -production install

# cli-kintoneをビルド
RUN mv vendor/ src
RUN gom build

# エントリーポイントとしてCLI
# コマンドとしてヘルプの表示を行う
ENTRYPOINT ["./cli-kintone"]
CMD ["-h"]
