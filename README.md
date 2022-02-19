# <img src="https://user-images.githubusercontent.com/54800851/154805510-b6d955c6-6ed8-4afa-aa72-b00d869271d2.jpg" alt="altテキスト" width="50px"> Look Teacher

学校の先生がどこにいるかわからなくて困ったことはありませんか？
学校の実験実習の一環で、それを解決するこのLook Teacherを作成しました。

LookTeacherでは教員の位置情報はバックグラウンド処理によって自動的にFirebaseに送信され、生徒・学生はリアルタイムに位置を把握することができます。
![image](https://user-images.githubusercontent.com/54800851/154804742-d4fdd3e9-4b1d-45f4-b5ea-4c6fb09812f9.png)

## 動作環境
- Flutter 2.5.3
- Androidのみbuild可能
  - Mac OSがなかったため設定を行わなかった  
- エミュレーターでは動かないので実機をご用意ください
- アプリのタスクを切った状態では位置情報が送られません
- 検出できない種類のBluetoothデバイスがあります

## Flutter採用理由

### 工期が短い
授業時間内にしか作業できない。\
授業時間は3～8時限目までの4.5時間で15週あったので、約70時間の作業時間しかなかった。\
私が慣れているFlutterであれば、慣れているので学習コストが低いし班員に教えることもでできると考えた。

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


- 静的解析
  - 推奨されない構文などを避けたいが、公式Linterほど厳しくしたくないため採用
    - pedantic_mono: any



詳しくはReadme.pdfをご覧ください。

