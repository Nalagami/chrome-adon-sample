#!/bin/bash

# 引数の数が0個の場合,処理終了
if [ $# -eq 0 ]; then
  echo "引数が指定されていません"
  exit 1
fi

# 第一引数の値のディレクトリを作成
mkdir -p "$1"

# 第一引数の値のディレクトリに移動
cd "$1" || exit

# 以下のファイルを作成
## manifest.json
cat <<EOF > manifest.json
{
    "manifest_version": 3,
    "name": "Hello Extensions of the World",
    "description": "Base Level Extension",
    "version": "1.0",
    "action": {
        "default_popup": "popup/popup.html",
        "default_icon": "images/icon.png"
    }
}
EOF

## background.js
touch background.js

## scripts
mkdir -p scripts
touch scripts/content.js
touch scripts/react.production.min.js

## popup
mkdir -p popup
touch popup/popup.html
touch popup/popup.js
touch popup/popup.css

## images
mkdir -p images
touch images/icon-16.png
touch images/icon-32.png
touch images/icon-48.png
touch images/icon-128.png

# 必要パッケージのインストール
npm i chrome-types
