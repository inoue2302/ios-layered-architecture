# iOSレイアードアーキテクチャ


## 概要
ios + swiftで開発する上での設計サンプルです。　  
EmbeddedFrameworkにて下記レイヤー構造に分割して責務を明確にしました。　  
各レイヤーの値変化はRxSwiftを使用してオブザーバーパターンにて伝達する仕組みです。  
今後はドメイン層に対してユニットテストなどを描きたいと思います

| レイヤー名        |        | 
| --------------- |:---------------:| 
| ユーザーインファーフェイス層 | UIKitやxibなどのUI関連を担当|
| アプリケーション層 | UI層の値と処理を担当   |
| ドメイン層 | 業務データ、業務ロジックを担当|
| インフラストラクチャ層 | データベースなどの技術基盤を担当、Api通信などもここが責務になる | 

## 開発環境
* xcode8.3
* swift3.1

## 使用外部ライブラリ
* RxSwift3.0
* RxCocoa3.0
* RealmSwift 2.5.0
