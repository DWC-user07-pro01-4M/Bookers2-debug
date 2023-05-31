# こちらは以下の５つのブランチがあります。
- main
    - develop_A
    - develop_B
    - develop_C
    - develop_D

| 各ブランチと内容 |
----|----
| main | 【フォロー/フォロワー機能」を実装】|
|      | 【検索機能を実装】|
|      | 【いいね/コメント機能を実装】|
|      | 【いいね/コメント機能の非同期通信化】|
| develop_A | 【SNSの機能を学ぼう】 |
| develop_B | 【記録アプリの機能を学ぼう】 |
| develop_C | 【コミュニティアプリの機能を学ぼう】 |
| develop_D | 【レビューサービスの機能を学ぼう】 |

![TOP](https://user-images.githubusercontent.com/124852092/242319452-639e6be4-1f40-45f7-bb7e-3c497eace876.png)

---

## インストール方法
* 以下のコマンドを上から順に実行してください。
```
git clone git@github.com:DWC-user07-pro01-4M/Bookers2-debug.git
```

```
cd bookers2-debug
```

```
rails db:migrate
```

```
yarn install
```

```
bundle install
```
* rails sでサーバーを立ち上げ、ブラウザで閲覧できれば成功です。