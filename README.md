# <img src="https://user-images.githubusercontent.com/54800851/154805510-b6d955c6-6ed8-4afa-aa72-b00d869271d2.jpg" alt="altテキスト" width="50px"> Look Teacher

学校の先生がどこにいるかわからなくて困ったことはありませんか？
学校の実験実習の一環で、それを解決するこのLook Teacherを作成しました。

LookTeacherでは教員の位置情報はバックグラウンド処理によって自動的にFirebaseに送信され、生徒・学生はリアルタイムに位置を把握することができます。
![image](https://user-images.githubusercontent.com/54800851/154804742-d4fdd3e9-4b1d-45f4-b5ea-4c6fb09812f9.png)

「レポートは手渡しで提出！」と言う先生や\
忙しすぎてほぼ研究室にいない先生の\
研究室を何度も訪れることが減ると良いなと思います。

このアプリは教員に一方的な負荷をかけて、学生が便利になるアプリでもあります。
教員の小さな負担で学生の大きなメリットを生むことができるので是非普及してほしいと思います。

## スクリーンショット

<img src="https://user-images.githubusercontent.com/54800851/154810639-ddcfde1d-9e7b-4ae4-9c67-aff781ea856c.jpg" alt="altテキスト" width="240px"> <img src="https://user-images.githubusercontent.com/54800851/154810119-6bb8fd8d-60c4-4bc7-9c0b-5d9d5d435491.jpg" alt="altテキスト" width="240px"> <img src="https://user-images.githubusercontent.com/54800851/154810465-75feda7b-3c43-4b17-97eb-8ac6f2dd0018.jpg" alt="altテキスト" width="240px"> <img src="https://user-images.githubusercontent.com/54800851/154810521-18b7b7ea-5f04-4cdf-8898-8b50eece5305.jpg" alt="altテキスト" width="240px"> 

左から順に
- ホーム画面
- 教員の位置表示
- Bluetoothデバイスの登録画面
- お気に入りの教員表示

## 動作環境
- Flutter 2.5.3
- Androidのみbuild可能
  - Mac OSがなかったため設定を行わなかった  
- エミュレーターでは動かないので実機をご用意ください
- アプリのタスクを切った状態では位置情報が送られません
- 検出できない種類のBluetoothデバイスがあります

## Flutter採用理由

### 工期が短い
実験時間内にしか作業できない。\
実験時間は3～8時限目までの4.5時間で15週あったので、約70時間の作業時間しかなかった。\
私が慣れているFlutterであれば、慣れているので学習コストが低いし班員に教えることもでできると考えたため。

### iOS Android対応
OSによらずアプリが使用できる必要があるため。\
今回Mac OSを用意することが出来なかったため、iOS用の設定をしていないが対応コストが低いと考えたため。

## 設計
GPSでは部屋の特定まではできないため、Bluetoothデバイスとその設置部屋情報を紐づけることで特定できるようにした。

ワイヤーフレーム -> [Miro](https://miro.com/app/board/uXjVObnASkI=/)

Cloud Firestoreのデータ構造↓↓

![kaisou drawio](https://user-images.githubusercontent.com/54800851/154809852-fef2700e-6ad7-4f6d-8893-2a1030ce66d5.svg)

### チーム作業について
#### メンバー
- YM
  - 情報科
  - Flutter開発経験あり
  - 担当
    - Flutterを教える
    - 設計
    - 画面の作成
    - Providerなどの基盤作成  
- YG
  - 情報科
  - Flutter開発経験なし
  - 担当
    - 画面の作成
    - 設計
- FK
  - 電気科
  - プログラミング初心者
  - 担当
    - 画面の作成
    - ロゴ作成

#### Fluuterチュートリアル
まずメンバーがどのくらいプログラミングがわかるか確認し、関数やクラスの説明から始めた。\
その後dartの基礎構文とFlutterのWidgetを説明し、Flutterのデモアプリを一緒に作った。\
作る際はGit・GitHubやVScodeの使い方も説明した。

はじめは説明と実装から理解してもらうことを意識した。

その後は、YG・FKはWebにあるFlutterのWidgetチュートリアルをして、YMはFlutterでBluetoothを扱う方法を調査した。

#### クラスモデル設計
使用するBluetoothパッケージを決定後、クラスモデルを設計した。

ある程度の設計はホワイトボードを使い議論し、詳細設計は実装しながら考えた。\
時間がないこととこの規模ならソースコードを見ればわかると思いクラス図は書かなかった。

<img src="https://user-images.githubusercontent.com/54800851/154811180-7a01e367-947b-4018-84a4-8ec9f233f7bd.png" alt="altテキスト" width="400px"> <img src="https://user-images.githubusercontent.com/54800851/154811185-c22e085c-5aef-43a7-ae10-407640faf9df.png" alt="altテキスト" width="400px"> 



## 主な採用パッケージ
- Firbase関連
  - リアルタイムなデータの扱いが簡単に実装できるため採用
    - firebase_core: "^1.2.1"
    - cloud_firestore: ^3.0.0
    - firebase_auth: ^3.2.0


- モデル実装関連
  - immutableなモデルを扱いやすくしてくれるため採用 
    - freezed: ^0.14.2
    - freezed_annotation: ^0.14.2


- Bluetooth関連
  - 検出できるBluetoothデバイスの種類が限られるが、AndroidとiOS両方に対応しているため採用  
    - flutter_blue: ^0.8.0


- Hooks関連
  - StetefullWidgetより慣れているため学習コスト削減のため採用
    - hooks_riverpod: ^0.14.0+4
    - flutter_hooks: ^0.17.0
- ローカル保存関連
  - お気に入りの学校IDや教員IDを保存するために採用
    - shared_preferences: ^2.0.8

- 静的解析
  - 推奨されない構文などを避けたいが、公式Linterほど厳しくしたくないため採用
    - pedantic_mono: any

Readme.pdfが学校に提出した実験報告書になっています。

